# Auto Research Loop — `organic-first-campaign`

A self-improving loop that runs the skill, scores outputs against 6 binary criteria, mutates the skill, and keeps improvements. Reference: `AUTORESEARCH-GUIDE.md`.

## What's in here

| File | Purpose |
|---|---|
| `AUTORESEARCH-GUIDE.md` | Methodology reference (how the loop works + guide's tips) |
| `rubric.md` | 6 binary criteria; max score 60 per iteration (10 outputs × 6) |
| `judge.md` | Scoring prompt; returns strict JSON per output |
| `optimizer.md` | Agent instructions for the mutation/verdict loop |
| `briefs/` | 6 canonical test inputs (sector coverage) |
| `baseline.json` | Current champion state |
| `dashboard.md` | Running log across iterations |
| `runs/<iter>-<ts>/` | Per-iteration artifacts: mutation diff, 10 outputs, scores, verdict, notes |

## How to run

Spawn a single agent with `optimizer.md` as instructions. The agent:

1. Reads current baseline and run history.
2. Picks a brief (rotates across 01-06).
3. Identifies the weakest criterion.
4. Proposes + applies a mutation to `skills/organic-first-campaign/SKILL.md` or a reference file.
5. Runs the skill 10× against the chosen brief.
6. Judges each output with `judge.md`.
7. Computes verdict (keep / revert).
8. Writes `runs/<iter>/` artifacts, updates `baseline.json` and `dashboard.md`.
9. Repeats until stopping condition.

## Streaming stages to the operator

During an autonomous run the optimizer **must stream stage transitions** as they happen. The main agent cannot tail subagent transcripts without overflowing context — streaming stages is the substitute heartbeat that lets the operator trust-but-verify the loop without dashboard UI.

### Fixed stage labels

```
[A] Scaffold        one-time, on loop init
[B] Baseline        one-time, before any mutation
[C] Mutation        one-time per iteration (applied to SKILL.md)
[D] Generation      per iteration, longest-running (4-8 min with Haiku)
[E] Scoring         per iteration, fast (deterministic + grep)
[F] Verdict         per iteration (keep/revert + artifacts written)
[G] Next iter prep  between iterations (brief rotation, next target)
```

### What to emit at each transition

Short bullet-block, never a wall of text:

- Current stage letter + name
- Per-output status: ⏳ pending, ✓ done, ✗ failed
- Metric state: aggregate total, weakest criterion, delta vs champion
- Running cost + session budget remaining

Example (iter 1 Stage D in progress):

```
[D] Iter 1 generation — 2 of 3 done
    outputs/01.md  ✓ (6:00, 66k tokens)
    outputs/02.md  ✓ (5:18, 63k tokens, partial c6 leak detected)
    outputs/03.md  ⏳ still running
    session cost so far: ~$0.17 of $2.50 cap
```

### Discipline around each iteration

- **Before Stage C:** state the target criterion + the hypothesis (what should improve, by how much, and why this locus). One sentence each.
- **During Stage D:** emit an update only when a real event happens — file lands on disk, completion notification fires, explicit operator question. **Do not poll.** Do not emit periodic "still waiting" messages unless asked.
- **After Stage F:** print the delta table (per-criterion baseline → new) and verdict reasoning in 1-2 sentences. Always name one thing the mutation did *not* fix — that becomes the iter N+1 hypothesis.

### Natural interruption points

Stages the operator can pause/intervene without losing work:

- **After [B]** — review baseline scores, tighten rubric if human scoring disagrees with judge by > 20%.
- **After [F]** — review kept mutation, decide whether to continue or branch.
- **Between iters ([G])** — swap brief, change target criterion manually, revert to an earlier champion.

### Anti-pattern: silent work

If the optimizer emits > 3 consecutive tool calls without a user-facing stage update, it has drifted off the protocol. Operators should hard-interrupt and ask for a state report.

---

## Stopping conditions (whichever first)

- Target score reached: **55/60**.
- Plateau: 3 consecutive iterations with no strict improvement.
- Session cap: 10 iterations.
- Judge drift detected on Sonnet spot-check (every 5th iteration).

## Cost budget

- Per iteration (Haiku): ~60k tokens ≈ $0.10-0.25.
- 10-iteration session: ~$1-2.
- 50-run campaign (5 sessions): ~$10 (matches guide's benchmark).

## Resuming across sessions

State lives in `baseline.json` + `dashboard.md`. New session reads both, continues from the last committed iteration. Do not reset unless starting a fresh campaign.

## Invariants

- `rubric.md` and `judge.md` are not edited by the optimizer — moving the metric is cheating.
- `briefs/` are not edited by the optimizer — the test set is fixed.
- Every kept mutation is committed to git with the diff + verdict in the commit body, so `git revert` is always available.
- No auto-push. Local commits only until the human ships.

## Extending to other skills

1. Copy `AUTORESEARCH-GUIDE.md`, `judge.md`, `optimizer.md`, `README.md` into the new skill's `.agentic-qe/` directory.
2. Rewrite `rubric.md` with 4-6 binary criteria appropriate to the new skill.
3. Replace `briefs/` with inputs appropriate to the new skill's domain.
4. Reset `baseline.json` and `dashboard.md`.
5. Run.
