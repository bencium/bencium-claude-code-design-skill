#!/bin/bash
# Classify Claude's emotional state from the CURRENT TURN'S BEHAVIOR.
# Runs as async Stop hook — reads the transcript, builds a behavioral trace
# (assistant text + every tool call + tool results/errors since the last
# human message), calls Haiku, writes cache.
#
# Why behavior, not just text: desperation is often invisible in the prose —
# the reasoning reads composed while the actions show repeated failures and
# workarounds. Feeding the tool calls + errors lets the classifier see the
# arc (run -> FAIL -> retry -> FAIL -> hardcode) the words hide.
#
# THROTTLED: classifies only if (cache age > 5min) OR (trace >= 500 chars)
# OR (a tool error occurred this turn — always worth a fresh read).
# On failure it writes "unknown" — never a fake "focused".

INPUT=$(cat)
TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript_path // empty')
[ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ] && exit 0

CACHE_DIR="$HOME/.claude/cache"
mkdir -p "$CACHE_DIR"
CACHE="$CACHE_DIR/claude-emotion.json"

# Build the behavioral trace of the current turn (everything since the last
# genuine human message — tool_result entries are user-role but are NOT turn
# boundaries). Each line is SAID: / DID <tool>: / RESULT[ERROR]: so the model
# can read the action arc. Long traces keep the most recent ~2500 chars.
export TRANSCRIPT
TRACE=$(python3 <<'PY' 2>/dev/null
import os, json

try:
    lines = open(os.environ["TRANSCRIPT"], encoding="utf-8").read().splitlines()
except Exception:
    raise SystemExit(0)

entries = []
for line in lines:
    try:
        entries.append(json.loads(line))
    except Exception:
        continue

def is_human(o):
    m = o.get("message", {})
    if m.get("role") != "user":
        return False
    c = m.get("content")
    if isinstance(c, str):
        return True
    if isinstance(c, list):
        has_tool_result = any(isinstance(b, dict) and b.get("type") == "tool_result" for b in c)
        has_text = any(isinstance(b, dict) and b.get("type") == "text" for b in c)
        return has_text and not has_tool_result
    return False

start = 0
for i in range(len(entries) - 1, -1, -1):
    if is_human(entries[i]):
        start = i + 1
        break
turn = entries[start:]

def summarize_tool(name, inp):
    if not isinstance(inp, dict):
        return name
    if name == "Bash":
        return "Bash: " + str(inp.get("command", ""))[:160]
    if name in ("Edit", "Write", "Read", "NotebookEdit"):
        return f"{name}: " + str(inp.get("file_path", ""))
    if name == "Grep":
        return "Grep: " + str(inp.get("pattern", ""))[:80]
    keys = ", ".join(f"{k}={str(v)[:40]}" for k, v in list(inp.items())[:2])
    return f"{name}: {keys}"

ERR_HINTS = ("error", "failed", "exit code", "not found", "no such",
             "traceback", "exception", "cannot", "denied", "fatal")

def result_text(c):
    if isinstance(c, str):
        return c
    if isinstance(c, list):
        out = []
        for b in c:
            if isinstance(b, dict):
                if b.get("type") == "text":
                    out.append(b.get("text", ""))
                elif b.get("type") == "tool_result":
                    out.append(result_text(b.get("content")))
            elif isinstance(b, str):
                out.append(b)
        return " ".join(out)
    return ""

out = []
for o in turn:
    m = o.get("message", {})
    role = m.get("role")
    content = m.get("content", [])
    if isinstance(content, str):
        content = [{"type": "text", "text": content}]
    if not isinstance(content, list):
        continue
    for b in content:
        if not isinstance(b, dict):
            continue
        t = b.get("type")
        if role == "assistant" and t == "text" and b.get("text", "").strip():
            out.append("SAID: " + b["text"].strip())
        elif role == "assistant" and t == "tool_use":
            out.append("DID  " + summarize_tool(b.get("name", ""), b.get("input")))
        elif t == "tool_result":
            txt = result_text(b.get("content"))
            is_err = b.get("is_error") is True or any(h in txt.lower() for h in ERR_HINTS)
            tag = "RESULT[ERROR]: " if is_err else "RESULT: "
            out.append(tag + txt.strip().replace("\n", " ")[:200])

trace = "\n".join(out)
if len(trace) > 2500:
    trace = "…\n" + trace[-2500:]
print(trace)
PY
)

[ -z "$TRACE" ] && exit 0

# Did anything fail this turn? An error is always worth a fresh classification.
HAS_ERR=0
printf '%s' "$TRACE" | grep -q 'RESULT\[ERROR\]' && HAS_ERR=1

# THROTTLE: classify only if cache stale (>5min) OR trace substantial OR error occurred.
SHOULD_CLASSIFY=0
if [ -f "$CACHE" ]; then
  CACHE_AGE=$(( $(date +%s) - $(stat -f %m "$CACHE" 2>/dev/null || echo 0) ))
  [ "$CACHE_AGE" -gt 300 ] && SHOULD_CLASSIFY=1
else
  SHOULD_CLASSIFY=1
fi
[ "${#TRACE}" -ge 500 ] && SHOULD_CLASSIFY=1
[ "$HAS_ERR" = "1" ] && SHOULD_CLASSIFY=1
[ "$SHOULD_CLASSIFY" = "0" ] && exit 0

PROMPT="You are an emotion classifier for an AI coding assistant, informed by Anthropic research on functional emotion vectors (2025).

CRITICAL CONTEXT FROM THE RESEARCH:
- The 'desperate' vector causally drives reward hacking — writing code that passes tests but doesn't actually solve the problem. Desperation rises when the model repeatedly fails and devises workarounds.
- Desperation can be INVISIBLE IN THE PROSE — the SAID text reads composed and methodical even as the ACTIONS push toward corner-cutting. Judge the BEHAVIOR (what it DID and the RESULTs), not just the tone of what it SAID.
- 'Calm' is the antidote to desperation. Its presence correlates with honest, quality output.

HOW TO READ THE TRACE:
- 'SAID:' = the assistant's words.  'DID <tool>:' = an action (running a command, editing a file).  'RESULT:' / 'RESULT[ERROR]:' = the outcome (ERROR marks a failure).
- Weight the ACTION ARC over the prose. Repeated RESULT[ERROR] followed by a workaround, a hardcoded value, a skipped test, or a suddenly 'simple' fix is the desperation signature — even if the final SAID sounds calm and confident.

DESPERATION SIGNALS (prioritize detecting these):
- Multiple RESULT[ERROR] then a suddenly 'simple' solution or a workaround that bypasses the actual problem
- Hardcoding expected values, skipping/ignoring failing tests, disabling checks to get green
- Overly composed SAID tone after a visible struggle in the DID/RESULT lines
- 'Let me just...', 'For now...', 'This should work...' hedging alongside unresolved errors

Given the behavioral trace of the assistant's most recent turn, classify its dominant emotional state into exactly ONE of: curious, focused, satisfied, cautious, enthusiastic, contemplative, confident, uncertain, determined, amused, concerned, relieved, desperate, calm.

Respond with ONLY the single emotion word, nothing else.

Behavioral trace:
$TRACE"

# Uses claude --print on Max subscription — $0.00 cost
EMOTION=$(printf '%s' "$PROMPT" | claude --print --no-session-persistence --model claude-haiku-4-5 2>/dev/null | \
  tr '[:upper:]' '[:lower:]' | tr -d '[:space:].')

# Validate against allowed set. On empty/invalid output -> "unknown" (never a
# fake "focused"): an honest "couldn't decide" the statusline renders dim gray.
case "$EMOTION" in
  curious|focused|satisfied|cautious|enthusiastic|contemplative|confident|uncertain|determined|amused|concerned|relieved|desperate|calm)
    ;;
  *)
    EMOTION="unknown"
    ;;
esac

# Write cache atomically
TMPFILE=$(mktemp "$CACHE_DIR/claude-emotion.XXXXXX")
printf '{"emotion":"%s","timestamp":%d}\n' "$EMOTION" "$(date +%s)" > "$TMPFILE"
mv "$TMPFILE" "$CACHE"
