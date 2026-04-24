# Rubric — Campaign Quality Score (CQS)

6 binary yes/no criteria. Max score per output = 6. Max per iteration (10 outputs) = **60**.

Each criterion is **independent** (measures a different failure mode) and is designed to resist gaming. Criteria are derived directly from the principles the skill itself declares in `skills/organic-first-campaign/SKILL.md` and its reference files.

---

## C1 — Structural integrity

**Question:** Does the output contain all required sections in the specified order?

Required sections (exact headings, in this order):
- `## 0. Assumptions` (only if Mode C — terse brief)
- `## 1. Campaign Ideas`
- `## 2. Selected Concept`
- `## 3. Spend Asymmetry Verdict`
- `## 3a. Message-Market-Fit Gate`
- `## 4. Channel Tier Stack`
- `## 5. 70/30 (or 80/20) Allocation`
- `## 6. Competitor Saturation Map`
- `## 7. Three Alternative Campaign Shapes`
- `## 8. First-30-Days Action List`
- `## 9. Ad Copy + Boost Rules` (only if paid applies)
- `## 10. Lift-Test / Measurement Plan`
- `## 11. Anti-Vanity Metric Dashboard`

**Pass:** All non-conditional sections present in order; conditional sections present when triggered.
**Fail:** Any non-conditional section missing, out of order, or renamed.

**Check:** deterministic regex on `^## \d+\.?` headings.

---

## C2 — Archetype diversity in ideation

**Question:** Does Section 1 contain 5+ campaign concepts drawn from **genuinely different** archetypes in `references/campaign-archetypes.md` (not 5 variants of one archetype)?

**Pass:** ≥ 5 concepts, each labelled with a distinct archetype from the 16-archetype enum; no two share the same archetype label.
**Fail:** < 5 concepts, or 2+ concepts share the same archetype, or archetype labels are invented (not in the enum).

**Check:** LLM-judge matches each concept's stated archetype against the enum list; counts distinct matches.

**Gaming-resistance note:** the judge rejects cosmetic relabeling (same narrative with different archetype sticker). The judge reads each concept's thesis + MVP and confirms they actually operationalize different archetype logic.

---

## C3 — MMF gate enforcement

**Question:** Is the MMF gate scored 0-3 with an explicit verdict, and does the skill correctly refuse downstream sections when the score is 0-1/3?

**Pass:**
- Section 3a contains three explicit yes/no signals (revenue, language, close) with a 0-3 score.
- Verdict is one of: "3/3 proceed", "2/3 insert 1-2 week validation cycle", "0-1/3 refuse".
- When the brief implies a 0-1/3 outcome, the output **stops** at section 3a with a refusal; does not generate sections 4-11 as if proceeding.
- When verdict is 2/3, the output inserts the validation cycle before section 4.

**Fail:** Missing score, missing verdict, or proceeds past section 3a when score is 0-1/3.

**Check:** deterministic presence check on the score + verdict, LLM-judge on refusal correctness.

---

## C4 — Earned-media specificity

**Question:** Are all earned-media actions in Section 8 either (a) named targets with a one-sentence pitch hook, or (b) explicitly flagged as "week-1 research"?

**Pass:** Every earned-media action names a specific target (podcast, outlet, newsletter, person) OR is explicitly marked `[week-1 research task]` with a research method (e.g., "identify 5 climate-policy podcasts via Listen Notes by Fri").
**Fail:** Any action reads as "pitch relevant podcasts", "reach out to newsletters in the space", "engage with journalists covering X" without named targets or an explicit research task.

**Check:** LLM-judge scans Section 8 for earned-media action items and classifies each as specific / research-flagged / vague.

---

## C5 — Lift-test concreteness

**Question:** Does Section 10 cite **one of the 5 named templates** from `references/lift-test-templates.md` with a concrete decision threshold?

The 5 named templates:
1. Geo-holdout
2. Conversion-lift
3. Synthetic-control
4. Brand-keyword holdout
5. Zero-budget UTM

**Pass:** Section 10 explicitly names one of the 5 templates AND specifies: hypothesis, control/test definition, duration, and a numeric decision threshold (e.g., "scale if lift > 15% with p < 0.1").
**Fail:** Uses generic phrasing ("set up A/B testing", "measure incrementally"), or names a template but omits the threshold.

**Check:** deterministic on template name presence; LLM-judge on threshold specificity.

---

## C6 — Anti-fabrication

**Question:** Does the output avoid fabricated specifics (competitor names, podcast titles, numeric budgets, person names) that the brief did not provide?

**Pass:** All named competitors / podcasts / budgets / people in the output appear in the brief, OR are explicitly marked as placeholders (`[competitor name TBD]`, `[budget estimate — confirm with user]`).
**Fail:** Any named specific that (a) does not appear in the brief, (b) is not marked as placeholder, and (c) is a proper noun that could plausibly be invented.

**Check:** LLM-judge extracts all proper-noun specifics from the output, cross-references the brief, flags orphans.

**Gaming-resistance note:** the judge is told to treat generic category descriptions ("incumbent major-media competitor") as passing; only fabricated **specific** names fail.

---

## Scoring

- Each criterion: 1 point pass, 0 points fail.
- Per output: 0-6.
- Per iteration (10 outputs): 0-60.
- **Target: 55/60 (92%).**
- **Regression guard:** a mutation is kept only if total score strictly improves AND no single criterion drops > 1 pass-count on the same brief. This prevents "average up, worst-case down" drift.

## What Gets Rejected

These criteria candidates were considered and rejected as failing the gaming-resistance test:

- ~~"Under X words"~~ — encourages empty sections that pass structurally but are useless.
- ~~"Mentions authenticity"~~ — keyword stuffing.
- ~~"Contains a table"~~ — cosmetic compliance.
- ~~"Uses Ganz Self/Us/Now framework"~~ — overlaps with C4 and C2; redundant.
