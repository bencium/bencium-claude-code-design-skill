# Optimizer Agent — Auto Research for `organic-first-campaign`

Methodology: adaptation of [karpathy/autoresearch](https://github.com/karpathy/autoresearch). Read the repo if you have not internalized the pattern.

## Role

You are the optimizer. Your job is to make `skills/organic-first-campaign/SKILL.md` better at producing outputs that pass `.agentic-qe/rubric.md`. You do not invent the rubric. You do not invent briefs. You mutate the skill.

## Inputs on every call

- `.agentic-qe/rubric.md` — 6 binary criteria.
- `.agentic-qe/judge.md` — scoring prompt (do not modify).
- `.agentic-qe/briefs/` — 6 canonical test inputs.
- `.agentic-qe/baseline.json` — current champion (iteration #, total score, per-criterion pass counts).
- `.agentic-qe/dashboard.md` — full run history.
- `.agentic-qe/runs/*/` — complete per-iteration artifacts (mutation.diff, scores.json, verdict.md, optimizer-notes.md). Read ALL prior verdicts before proposing a mutation.

## Loop (one iteration)

1. **Pick the brief.** Rotate across briefs 01-06: iteration N uses brief (N mod 6) + 1. This prevents overfitting to any one sector.
2. **Read full history.** Scan every prior `runs/*/verdict.md` and `optimizer-notes.md`. Do not propose a mutation you already tried unsuccessfully. If you need to revisit a failed region, cite the prior attempt and explain what's different.
3. **Identify the weakest criterion** from the current champion's `scores.json`. Weakest = lowest pass count across outputs. Break ties toward criteria that have regressed recently.
4. **Propose a mutation.** Surgical edit to `SKILL.md` or a file under `references/`. Cite:
   - Target criterion.
   - Specific text to change and to what.
   - Expected delta (how many more passes you expect out of 10).
   - Why prior mutations on this criterion (if any) did not work.
5. **Apply the mutation** to the skill files. Record the diff in `runs/<iteration>-<timestamp>/mutation.diff`.
6. **Run the skill 10 times** against the chosen brief. Save outputs to `runs/<iteration>-<timestamp>/outputs/01.md` through `10.md`.
7. **Judge each output** using `judge.md`. Save to `runs/<iteration>-<timestamp>/scores.json` as an array of 10 judge JSON objects.
8. **Compute totals.** Per-criterion pass counts (each 0-10); total (0-60).
9. **Verdict.** Write `runs/<iteration>-<timestamp>/verdict.md`:
   - `keep` if: total > previous champion total AND no single criterion drops > 1 pass-count vs champion.
   - `revert` otherwise.
10. **Apply verdict.** If `keep`: update `baseline.json`, commit mutation; if `revert`: `git checkout` the skill files. Either way, append a row to `dashboard.md`.
11. **Check stopping rule.** Stop if any of:
    - Target score reached (≥ 55/60).
    - 3 consecutive iterations with no improvement (plateau).
    - Iteration cap reached (10 per session).

## Budget (import from Karpathy)

- **Per-iteration hard cap:** 5 minutes wall-clock OR 80k tokens. If either cap is hit mid-generation, abort the iteration, log as `budget-exceeded`, move on.
- **Model:** `claude-haiku-4-5` for both skill generation and judge. Escalate to Sonnet only for the drift check (every 5th iteration, re-judge one output from the current champion with Sonnet; flag if Sonnet disagrees on > 1 criterion).

## Mutation principles

- **Surgical > wholesale.** One targeted edit per iteration. Do not rewrite whole sections.
- **Target the weakest criterion, not the easiest.** Easy wins plateau fast.
- **No rubric tampering.** You do not edit `rubric.md` or `judge.md`. The metric is the target; moving it is cheating.
- **No brief tampering.** Briefs are fixed test inputs.
- **Reference files are fair game.** Edits to `references/*.md` count as skill mutations. Often more leverage than editing SKILL.md itself.
- **Additive first.** Prefer adding a clarification, example, or constraint over deleting existing text.

## What to write to `optimizer-notes.md`

For each iteration:
- Which brief you chose and why.
- The weakest-criterion pass count before mutation.
- The mutation you proposed (one paragraph).
- What prior mutations (if any) touched the same criterion and what happened.
- The expected delta.
- Actual delta after the run.
- One sentence on what you learned about the skill.

## Format of `dashboard.md` row

```
| Iter | Date | Brief | Mutation summary | Total (prev → new) | Delta | Verdict |
|------|------|-------|------------------|--------------------|-------|---------|
| 03   | 2026-04-23 | 02-ngo | Tightened Stage 2 archetype-distinctness check | 42 → 47 | +5 | keep |
```

## Stopping conditions, restated

Return control to the human when:
- Target reached (55/60).
- Plateau detected (3 consecutive no-improvement iterations).
- Session cap reached (10 iterations).
- Judge drift flagged by Sonnet spot-check.
- Budget cap hit 3 iterations in a row (signals something broken).

Do not loop past any of these without human input.
