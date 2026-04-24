# Iter 2 Verdict — KEEP (ceiling at n=3)

**Mutation:** Anti-fabrication rule extended into Stage 4 of SKILL.md — covering SEO keyword examples, long-tail query lists, directory references, competitor saturation. Forbids banned incumbent-name token in any casing, including compound forms like "[incumbent] alternative". Explicitly states the rule applies through Stages 5–10.

**Target criterion:** c6 (carryover from iter 1; failure had migrated from Stage 2 to Stage 4).

**Brief:** 02 (NGO climate) — **first brief rotation**, tests cross-sector generalization.

## Result

| Metric | Baseline (iter 0) | Iter 1 | Iter 2 | Total Δ |
|---|---|---|---|---|
| Aggregate total | 16/18 | 17/18 | **18/18** | **+2** |
| c1 structure | 3/3 | 3/3 | 3/3 | 0 |
| c2 archetype diversity | 3/3 | 3/3 | 3/3 | 0 |
| c3 MMF gate | 3/3 | 3/3 | 3/3 | 0 |
| c4 earned-media specificity | 3/3 | 3/3 | 3/3 | 0 |
| c5 lift-test concreteness | 3/3 | 3/3 | 3/3 | 0 |
| **c6 anti-fabrication** | **1/3** | **2/3** | **3/3** | **+2** |

**Keep criteria met:** aggregate strictly > previous champion (18 > 17); no per-criterion regression; target criterion reached max.

## What this proves

1. **The Stage 4 extension eliminated the SEO-leak migration.** Iter 1 left 1 output with "sentry alternative" in its keyword list. Iter 2 shows 0 leaks across all 3 outputs.

2. **The fix generalizes cross-sector.** Brief 02 is a climate NGO with "industry-front groups" as the unnamed opposition — a completely different sector from brief 01's SaaS incumbent. The mutation holds. This was the iter 2 hypothesis and it validated.

3. **The layered-rule pattern works.** Two surgical additions (Stage 2 + Stage 4) beat one large pre-flight rule at the top of SKILL.md (which would have been the Option B fallback). Locality matters: the rule fires at the moment it's needed, not 500 lines earlier in the prompt context.

## Ceiling at n=3

18/18 is the theoretical max at this scale. The loop has hit the target-reached stopping condition (`target_score` 55/60 maps to 100% pass-rate, which 18/18 achieves). **Further improvement requires more variance to surface rarer failure modes.**

## Options for continuation

**Option 1 — Scale up to n=10 per iteration.** Reveals failure modes that appear at <33% frequency. 3× cost per iteration (~$0.30-0.75). Matches the guide's canonical n=10 setup.

**Option 2 — Test the champion on harder briefs.** Run the current SKILL.md against brief 06 (terse-brief stress test, only one sentence of input) and brief 04 (solo consumer, severe asymmetry). If it holds, commit. If it breaks, we have a new failure mode to target.

**Option 3 — Commit and ship.** The two mutations are durable, cross-sector-tested, and fix the only failure mode observed in the baseline. Further iteration may be diminishing returns for `organic-first-campaign` specifically — the skill is now structurally sound on all 6 criteria at n=3 scale.

**Recommendation:** Option 2. Cheap (~$0.20 for 2 briefs × 3 runs), directly tests robustness, and if anything breaks, it surfaces iter 3's target criterion organically.

## Cost accounting

- Iter 2 Haiku generations: ~190k tokens, ~5-5.5 min wall-clock
- Scoring: deterministic grep, ~$0 LLM
- Iter 2 cost: ~$0.10
- **Cumulative session cost: ~$0.30**
- Session budget remaining: ~$2.20 / 8 iterations

## What the mutation did not do

Important to name, per the workflow convention:

- The mutation is **additive**, not restructuring. It did not change any existing Stage 4 or Stage 5 logic.
- It does **not** prevent fabrication in a brief where the user *did* name the incumbent (that's allowed — the rule only kicks in when the brief is abstract).
- It does **not** address fabrication of other specifics (budgets, dates, metrics) the brief did not supply — c6's rubric covers those but they didn't surface as failure modes in baseline.

If a n=10 scale-up surfaces budget or metric fabrication, that becomes iter 3's target.
