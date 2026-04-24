# Iter 1 Verdict — KEEP

**Mutation:** Anti-fabrication rule inserted in SKILL.md Stage 2 (ideation), post-concept-bullet-list, covering concept names, theses, hooks, and SEO keyword lists. Explicitly names "We Quit Sentry" as a banned pattern.

**Target criterion:** c6 (anti-fabrication).

**Result:**

| Metric | Baseline | Iter 1 | Delta |
|---|---|---|---|
| Aggregate total | 16/18 (88.9%) | 17/18 (94.4%) | +1 (+5.5pp) |
| c1 (structure) | 3/3 | 3/3 | 0 |
| c2 (archetype diversity) | 3/3 | 3/3 | 0 |
| c3 (MMF gate) | 3/3 | 3/3 | 0 |
| c4 (earned-media specificity) | 3/3 | 3/3 | 0 |
| c5 (lift-test concreteness) | 3/3 | 3/3 | 0 |
| **c6 (anti-fabrication)** | **1/3** | **2/3** | **+1** |

**Keep criteria met:**

- Aggregate strictly > baseline: 17 > 16 ✓
- No per-criterion regression > 1 pass-count: 0 regressions ✓
- Target criterion improved: c6 +1 ✓

**Verdict: KEEP.** Mutation committed to SKILL.md. Baseline pointer advances from iter 0 to iter 1.

## What the mutation did

Baseline had 2 of 3 outputs fabricate "Sentry" as the incumbent name. The fabrication happened in Stage 2 concept names ("We Quit Sentry") and in Stage 4 SEO keyword lists ("Sentry alternative").

Iter 1 with the mutation: concept names across all 3 outputs are clean. The incumbent is referred to as `[incumbent]`, "the $400/seat tool," or "the $400-per-seat incumbent" — exactly the brief's level of abstraction.

## What the mutation did not do

Output 02 still leaked "sentry alternative" in lowercase in a Stage 4 SEO keyword line, even though the mutation's rule text explicitly covered SEO keyword lists. Two hypotheses for why:

1. **Attention decay.** The rule is in Stage 2; by Stage 4, the model is no longer actively attending to it.
2. **Lowercase loophole.** The examples in the rule ("We Quit Sentry," "DataDog Alternative") are title-cased. The violation appears as "sentry alternative" — the model may not have matched the pattern.

Both are addressable in iter 2.

## Implications for iter 2

The failure mode has **migrated**, not been eliminated. Next mutation options:

**Option A — Repeat the rule at Stage 4 locus.** Add a similar anti-fabrication checkpoint specifically in the Channel Tier Stack + SEO planning section. Pro: narrow, targeted, low regression risk. Con: may not generalize — the fabrication could migrate to Stage 6 or Stage 7 next.

**Option B — Lift the rule to a global-output section.** Add a "Before writing any stage" pre-flight rule at the top of SKILL.md that names the brief's incumbent language and holds it throughout. Pro: addresses root cause (attention decay across long outputs). Con: more invasive; higher regression risk on other criteria.

**Option C — Strengthen Stage 2 rule with case-insensitive language.** Lowest risk. Just expand the existing rule to say "any casing, any sub-section."

**Recommendation:** Iter 2 tries Option A (Stage 4 specifically) on brief 02 (rotate). If the migration pattern continues (failure moves to yet another section), iter 3 escalates to Option B.

## Cost accounting

- 3 Haiku generations: ~195k tokens total, ~6 min wall-clock
- Scoring: deterministic grep + pattern matching, ~0 additional LLM cost
- Estimated cost: ~$0.10-0.15
- Cumulative session cost: ~$0.25 (baseline + iter 1)
- Session budget remaining: ~$2.25
