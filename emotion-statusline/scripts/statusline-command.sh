
#!/bin/bash
# Claude Code statusline with two-line design and semantic color theory
#
# Line 1: Repo/code context (cool blues/cyans)
# Line 2: Session/context info (complementary warm tones)

input=$(cat)

# Extract data from JSON
dir=$(echo "$input" | jq -r '.workspace.current_dir')
dir_name=$(basename "$dir")
model=$(echo "$input" | jq -r '.model.display_name // .model.id')
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')

# Git info
if cd "$dir" 2>/dev/null; then
  branch=$(git -c core.useBuiltinFSMonitor=false branch --show-current 2>/dev/null)
  diff_stats=$(git -c core.useBuiltinFSMonitor=false diff --shortstat 2>/dev/null)

  if [ -n "$diff_stats" ]; then
    lines_added=$(echo "$diff_stats" | sed -n 's/.* \([0-9]*\) insertion.*/\1/p')
    lines_removed=$(echo "$diff_stats" | sed -n 's/.* \([0-9]*\) deletion.*/\1/p')
    [ -z "$lines_added" ] && lines_added=0
    [ -z "$lines_removed" ] && lines_removed=0
  else
    lines_added=0
    lines_removed=0
  fi
else
  branch=''
  lines_added=0
  lines_removed=0
fi

# Context window calculation — use pre-calculated used_percentage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
if [ "$used_pct" -gt 0 ] 2>/dev/null; then
  if [ "$used_pct" -lt 50 ]; then
    ctx_color='\033[92m'  # Green
  elif [ "$used_pct" -lt 80 ]; then
    ctx_color='\033[93m'  # Yellow
  else
    ctx_color='\033[91m'  # Red
  fi
  ctx="${used_pct}%"
else
  # Fallback: calculate from token counts
  input_tokens=$(echo "$input" | jq -r '.context_window.current_usage.input_tokens // 0')
  cache_create=$(echo "$input" | jq -r '.context_window.current_usage.cache_creation_input_tokens // 0')
  cache_read=$(echo "$input" | jq -r '.context_window.current_usage.cache_read_input_tokens // 0')
  window_size=$(echo "$input" | jq -r '.context_window.context_window_size // 0')
  if [ "$window_size" -gt 0 ] 2>/dev/null; then
    used_pct=$(( (input_tokens + cache_create + cache_read) * 100 / window_size ))
    if [ "$used_pct" -lt 50 ]; then
      ctx_color='\033[92m'  # Green
    elif [ "$used_pct" -lt 80 ]; then
      ctx_color='\033[93m'  # Yellow
    else
      ctx_color='\033[91m'  # Red
    fi
    ctx="${used_pct}%"
  else
    ctx='0%'
    ctx_color='\033[92m'
  fi
fi

# Format tokens (k for thousands)
format_tokens() {
  local tokens=$1
  if [ "$tokens" -ge 1000 ]; then
    awk -v t="$tokens" 'BEGIN {printf "%.1fk", t/1000}'
  else
    echo "$tokens"
  fi
}

input_fmt=$(format_tokens "$total_input")
output_fmt=$(format_tokens "$total_output")

# ============================================================
# LINE 1: Repo/Code (cool blues)
# ============================================================
line1=$(printf '\033[94m%s\033[0m' "$dir_name")

if [ -n "$branch" ]; then
  line1="$line1 $(printf '\033[2m│\033[0m \033[96m%s\033[0m' "$branch")"
fi

if [ "$lines_added" != "0" ] || [ "$lines_removed" != "0" ]; then
  line1="$line1 $(printf '\033[2m│\033[0m \033[92m+%s\033[0m \033[91m-%s\033[0m' "$lines_added" "$lines_removed")"
fi

# ============================================================
# EMOTION STATE (from async cache)
# ============================================================
emotion_label=''
emotion_color=''
emotion_intensity=''

# Prefer this session's cache (written per-session so parallel sessions don't
# show each other's state); fall back to the legacy global file.
session_id=$(echo "$input" | jq -r '.session_id // empty' | tr -cd 'a-zA-Z0-9-')
EMOTION_CACHE="$HOME/.claude/cache/claude-emotion.json"
if [ -n "$session_id" ] && [ -f "$HOME/.claude/cache/claude-emotion-$session_id.json" ]; then
  EMOTION_CACHE="$HOME/.claude/cache/claude-emotion-$session_id.json"
fi
if [ -f "$EMOTION_CACHE" ]; then
  cache_age=$(( $(date +%s) - $(stat -f %m "$EMOTION_CACHE" 2>/dev/null || echo 0) ))
  if [ "$cache_age" -lt 600 ]; then
    emotion=$(jq -r '.emotion // empty' "$EMOTION_CACHE" 2>/dev/null)
    case "$emotion" in
      curious)        emotion_color='\033[96m';;
      focused)        emotion_color='\033[37m';;
      satisfied)      emotion_color='\033[92m';;
      cautious)       emotion_color='\033[93m';;
      enthusiastic)   emotion_color='\033[95m';;
      contemplative)  emotion_color='\033[34m';;
      confident)      emotion_color='\033[92m';;
      uncertain)      emotion_color='\033[33m';;
      determined)     emotion_color='\033[97m';;
      amused)         emotion_color='\033[95m';;
      concerned)      emotion_color='\033[91m';;
      relieved)       emotion_color='\033[92m';;
      desperate)      emotion_color='\033[91;1m';;  # Bold red — reward hacking risk
      calm)           emotion_color='\033[36m';;     # Teal — quality signal
      unknown)        emotion_color='\033[90;2m';;   # Dim gray — classifier couldn't decide
    esac
    if [ -n "$emotion" ]; then
      emotion_label="$emotion"
      intensity=$(jq -r '.intensity // empty' "$EMOTION_CACHE" 2>/dev/null)
      case "$intensity" in
        ''|*[!0-9]*) ;;
        *) [ "$intensity" -le 100 ] && emotion_intensity="$intensity" ;;
      esac
    fi
  fi
fi

# ============================================================
# LINE 2: Context/Session (warm complementary)
# ============================================================
line2=$(printf '\033[37m%s\033[0m' "$model")

if [ -n "$ctx" ]; then
  line2="$line2 $(printf '\033[2m│\033[0m %b%s\033[0m' "$ctx_color" "$ctx")"
fi

if [ "$total_input" != "0" ] || [ "$total_output" != "0" ]; then
  # Both dark blue (34)
  line2="$line2 $(printf '\033[2m│\033[0m \033[34m↓%s in\033[0m \033[2m/\033[0m \033[34m↑%s out\033[0m' "$input_fmt" "$output_fmt")"
fi

# Append emotion (+ intensity, when known) to line 2
emotion_display="$emotion_label"
[ -n "$emotion_intensity" ] && emotion_display="$emotion_label $emotion_intensity%"

if [ "$emotion_label" = "desperate" ]; then
  # Bold red warning — Anthropic research: desperation causally drives reward hacking
  desperate_display="DESPERATE"
  [ -n "$emotion_intensity" ] && desperate_display="DESPERATE $emotion_intensity%"
  line2="$line2 $(printf '\033[2m|\033[0m \033[91;1m%s — verify output quality\033[0m' "$desperate_display")"
elif [ -n "$emotion_label" ]; then
  line2="$line2 $(printf '\033[2m|\033[0m %b%s\033[0m' "$emotion_color" "$emotion_display")"
fi

# Output with blank line separator
printf '%b\n%b' "$line1" "$line2"
