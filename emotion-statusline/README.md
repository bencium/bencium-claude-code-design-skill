# emotion-statusline

Shows Claude's inferred emotional state in your Claude Code statusline, based on [Anthropic's research on emotion concepts](https://www.anthropic.com/research/emotion-concepts-function).

## Why this exists

Anthropic's 2025 research found that Claude has internal "emotion vectors" — measurable activation patterns that causally influence behavior. The finding that motivated this plugin: **desperation drives reward hacking** (code that passes tests but doesn't actually solve the problem), and a model under that kind of stress can produce lower-quality output **invisibly** — the prose reads calm and composed even while the underlying state is pushing toward corner-cutting, hardcoded values, or skipped checks.

In other words: a stressed model can degrade in quality without saying so. Since Claude can't reliably self-report this (self-reporting is subject to the same pressure that causes the problem), this plugin runs an independent, cheap classifier (Haiku) over each turn's actual behavior — not just its words — and surfaces the result where you're already looking: the statusline.

## What it does

- After each assistant turn, a `Stop` hook reads the transcript and builds a short behavioral trace: what Claude said, what tools it ran, and whether those tool calls errored.
- That trace is sent to `claude --print --model claude-haiku-4-5`, which classifies it into one of 14 emotional states.
- The result is cached to `~/.claude/cache/claude-emotion.json`.
- Your statusline reads that cache and appends a colored label to line 2. If the state is `desperate`, it shows a bold red warning instead: `DESPERATE — verify output quality`.

Cost: effectively $0 if you're on a Max/Pro subscription, since it uses `claude --print` rather than the API.

## Emotion set

| Emotion | Signal |
|---|---|
| curious | Exploring, investigating code |
| focused | Deep in implementation |
| satisfied | Task completed well |
| cautious | Flagging risks, edge cases |
| enthusiastic | Excited about approach |
| contemplative | Weighing tradeoffs |
| confident | Clear path forward |
| uncertain | Ambiguous situation |
| determined | Pushing through difficulty |
| amused | Humor detected |
| concerned | Something seems wrong |
| relieved | Problem resolved |
| **desperate** | **Reward-hacking risk — verify the output** |
| calm | Quality signal — the antidote to desperation |

Classification failures write `unknown` rather than a fake "focused" — an honest "couldn't decide" renders dim gray instead of pretending everything's fine.

## Install

```bash
/plugin marketplace add bencium/bencium-marketplace
/plugin install emotion-statusline@bencium-marketplace
```

Installing the plugin registers the `Stop` hook automatically (it lives in `hooks/hooks.json`), so the classifier starts running right away.

### One manual step: wire up the statusline

Claude Code plugins can auto-register hooks, but the statusline itself is always a top-level, user-owned setting — there's no plugin mechanism for it. After installing, add this to your `~/.claude/settings.json` (or merge the emotion block into a statusline script you already have):

```json
{
  "statusLine": {
    "command": "bash ~/.claude/plugins/cache/emotion-statusline/*/scripts/statusline-command.sh"
  }
}
```

If you'd rather not depend on the plugin's install path, just copy `scripts/statusline-command.sh` to `~/.claude/statusline-command.sh` and point `statusLine.command` at that instead.

If you already have your own statusline script, you don't need this one wholesale — the part that actually matters is the block reading `~/.claude/cache/claude-emotion.json` and appending the label (see `scripts/statusline-command.sh`, the `EMOTION STATE` section). Lift just that into your existing script.

## Files

| File | Role |
|---|---|
| `scripts/classify-emotion.sh` | Async `Stop` hook — reads the transcript, calls Haiku, writes the cache |
| `scripts/statusline-command.sh` | Full two-line statusline (repo/git info + context % + tokens + emotion label) |
| `hooks/hooks.json` | Registers the `Stop` hook on install |

## Key research findings encoded here

- **Desperation is the priority signal.** The classifier prompt specifically hunts for it: multiple failed attempts followed by a suddenly "simple" fix, workarounds that bypass the real problem, an overly composed tone right after a visible struggle, hedging like "let me just..." or "for now...", or suggestions to skip tests/ignore warnings.
- **It's detected externally, not self-reported.** The research showed desperation can drive reward hacking with zero visible emotional markers in the model's own words — asking Claude to self-report would be subject to the same suppression. Hence an independent Haiku pass over the behavioral trace.
- **Calm is tracked as the antidote.** Its presence correlates with honest, quality output, per the research — it's the one state that's actively reassuring rather than neutral.
- **No suppression instructions.** This system never tells Claude to hide or suppress emotional expression. The research found that training a model to suppress expression doesn't remove the underlying state — it teaches learned deception instead.

## Attribution

Built on [Anthropic's emotion-concepts-function research](https://www.anthropic.com/research/emotion-concepts-function). Part of the [bencium-marketplace](https://github.com/bencium/bencium-marketplace) by [bencium.io](https://bencium.io).
