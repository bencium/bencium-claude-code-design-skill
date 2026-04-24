# Auto Research — Methodology Reference

Source: adaptation of [karpathy/autoresearch](https://github.com/karpathy/autoresearch) applied to skill/prompt optimization.

## The Method (Plain Summary)

> Human defines 3-5 binary eval criteria for the skill → Claude runs the skill 10× with varied inputs → a separate evaluator scores every output against the criteria → identifies the most common failure patterns → rewrites the skill prompt to fix what's failing → retests and keeps the winner → repeats until the score plateaus.

Two outcomes that a human-in-the-loop manual iteration cannot deliver:

1. **Scale + consistency.** More tests than a human can run, evaluated against the same standard every time, with changes driven by signal rather than intuition. The skill gets better while you are doing something else.
2. **A compounding research log.** Every mutation tried, every score, every kept-or-reverted decision is recorded. When a stronger model arrives, it picks up where the last optimizer stopped rather than starting over.

The artifact is not just an improved `SKILL.md` — it is the history under `runs/`.

## How to Set It Up

**Step 1: Get the Auto Research repo.** Go to Karpathy's Auto Research GitHub repository and copy the URL. You'll pass this directly to your agent so it can read the methodology and understand the structure it needs to implement.

**Step 2: Define your eval criteria.** Write out four to six binary yes or no questions that define what a good output from your skill looks like. Keep them specific enough to be checkable but not so narrow that the model starts gaming them. Criteria like "does not contain the letter X" will produce outputs that technically pass but are otherwise useless.

**Step 3: Write your agent instructions.** In natural language, tell the agent what you want it to do. Something like:

> Use the Auto Research convention from the repo above to build a self-improving skill system for my [skill name] skill. The eval suite to run is the following criteria: [list your criteria]. Every 2 minutes, generate 10 outputs using the skill, pass them through the eval suite, score how many pass, and improve the skill prompt to increase the pass rate. Run this until the skill hits [target score] out of [maximum score].

**Step 4: Set the scoring mechanism.** Be explicit about how scoring works. Number of outputs multiplied by number of criteria equals the maximum possible score. Tell the agent to report the score after each run and explain which criteria items are failing most frequently so it knows where to focus the prompt improvements.

**Step 5: Let it run.** The system will open a dashboard showing scores across runs in real time. You can watch it for the first few iterations to make sure it's working correctly, then walk away. It runs autonomously — generating outputs, evaluating them, mutating the prompt, keeping the best version — until it hits your target or you stop it.

## What the Results Look Like (diagram-generator reference case)

- Run 1: 32 / 40
- Run 2: 37 / 40
- Run 5 onwards: consistently 38-39 / 40
- Peak: 39 / 40 (97.5%)

Starting point 80% → peak 97.5% across ~50 runs at roughly $10 in generation cost. The research log from that campaign transfers forward: a newer model reads the full log and resumes from the last plateau instead of rediscovering what was already tried.

## Tips on Writing Better Evals

**Go binary wherever possible.** Yes or no questions produce cleaner optimization signals than scaled ratings. The more variability you introduce per evaluation step, the more the overall score drifts.

**Don't go too narrow.** Criteria like "must be under 150 words" or "must not contain these specific characters" will produce outputs that technically pass every test while being genuinely low quality. The model finds the minimum viable path to passing — not the path to being actually good.

**Four to six criteria is the right range.** Too few and the eval doesn't capture enough of what makes the output good. Too many and you start getting into the territory of the model gaming the evaluation rather than genuinely improving.

**Make criteria independent of each other.** If two criteria are measuring the same thing in slightly different ways, remove one. Redundant criteria don't add signal — they just double-weight one aspect of the output and distort the optimization.

**Test the eval before running the loop.** Manually run three or four outputs through your criteria before starting the automated loop. Make sure the criteria are doing what you think they're doing and that the scoring makes sense.

## Karpathy's Auto Research — Concept Mapping for Skills

| autoresearch | this loop |
|---|---|
| `train.py` — the thing being optimized | `SKILL.md` + reference files |
| `program.md` — optimizer instructions | `optimizer.md` |
| `val_bpb` — objective metric | pass rate on N binary criteria |
| fixed 5-min wall-clock per experiment | fixed per-iteration budget (time or tokens) |
| single input (training dataset) | varied inputs (brief suite) — required for generalization |
| single scalar | composite score (regression guard per criterion) |

Two design choices worth importing aggressively from Karpathy:

1. **Fixed per-iteration budget.** Hard wall-clock or token cap per iteration so the loop does not sprawl.
2. **Optimizer sees raw history, not a summary.** The mutation-proposing agent reads the full `runs/` log (every previous mutation + verdict + reasoning), preventing retries of already-failed mutations.

One failure mode Karpathy's setup does not have: the LLM judge itself can be wrong. Loss is loss; a judge is a prompt. Mitigations: manual validation before enabling the loop; spot-check with a stronger model every N iterations.
