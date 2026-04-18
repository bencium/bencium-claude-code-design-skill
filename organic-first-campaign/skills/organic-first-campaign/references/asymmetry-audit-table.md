# Asymmetry Audit Table

Stage 3 of `SKILL.md` uses this table to classify the user's spend gap against their
competition. The classification drives everything downstream — channel stack, allocation,
ad-copy decisions, refusal rules.

## The three levels

| Level | Ratio (competitor : user) | What it looks like | Primary channel stance |
|---|---|---|---|
| **Mild** | 1:2 to 1:5 | They spend 2–5× what you spend. Typical incumbent vs. challenger. | Hybrid: full Tier 1–3 stack, selective Tier 4 with lift tests. |
| **Severe** | 1:5 to 1:50 | They spend 5–50× what you spend. Typical startup vs. well-funded competitor, NGO vs. corporate, challenger party vs. establishment. | Organic-first: Tier 1–2 heavy, targeted Tier 3, avoid broad Tier 4. |
| **Categorical** | 1:50+ (or non-comparable — state capture, foreign support, infinite pockets) | You cannot be in a spending race at all. Different game entirely. | Full asymmetric: Tier 1–2 only, volunteer/community networks, earned media, counter-positioning. Refuse broad cold-paid. |

## If the user gave numbers

Compute `competitor monthly spend ÷ user monthly spend`. If the user gave annualized numbers,
convert. If the user gave lifetime numbers (e.g., "we have $50k total"), ask for their
runway in months and divide.

Edge cases:
- **User is bootstrapping with $0 ad budget.** Ratio is infinite — treat as categorical.
- **Competitor's "budget" includes state media, regulatory capture, or foreign support.**
  Treat as categorical regardless of direct spend comparison.
- **User has more budget than competitor but is losing.** Asymmetry is not the bottleneck —
  something is wrong with product, message, or channel fit. Re-interview before prescribing.

## If the user did not give numbers

Ask these heuristic questions and classify qualitatively:

1. **Can the competitor afford billboards in your market?** Yes → at least severe.
2. **Do they dominate paid search in your category?** Yes → at least severe.
3. **Are they running influencer deals worth five figures a month?** Yes → severe or
   categorical.
4. **Do they have state backing, regulatory capture, or government-adjacent funding?**
   Yes → categorical.
5. **Is there a national TV campaign, a presence at every major industry event, or
   pre-installed distribution (default search engines, partnerships with distributors)?**
   Yes → categorical.
6. **Can you realistically match even 20% of their monthly paid spend for the next six
   months?** No → severe at minimum.

If the user answers "no" to most of these, they are probably in mild asymmetry territory.
If "yes" to 3–4, severe. If "yes" to 5–6, categorical.

## Mild asymmetry — playbook summary

- Full hybrid stack is on the table.
- 70% effort to organic (Tier 1–2), 30% to paid (Tier 3, rare Tier 4).
- Pay for Tier 3 only after Tier 2 content has demonstrated organic traction (24–48h gate).
- Run lift tests on any Tier 4 spend. Kill broadcast-style Tier 4 that does not clear
  the threshold in the lift-test templates.
- Competitive advantage: speed and specificity. Move faster than the incumbent; speak to
  specific segments the incumbent is too broad to address.

## Severe asymmetry — playbook summary

- Organic-first. 80/20 in favor of organic is often safer than 70/30.
- Tier 1 and Tier 2 do the heavy lifting. Tier 3 is used surgically — warm retargeting,
  long-tail search, amplification of proven Tier 2 winners only.
- Avoid broad Tier 4 (cold Meta, generic search, display). The CPA and lift-test math
  does not work at this ratio.
- Competitive advantage: authenticity and narrative. You cannot outspend; you can
  outspecify. Concentrate on a narrow audience that the competitor cannot address
  because they are too broad.
- Measurement: run a lift test before *any* paid spend, not after. Use geo-holdouts.

## Categorical asymmetry — playbook summary

- Tier 1 and Tier 2 only. Broad paid is off the table.
- Build the thing the competitor cannot buy: volunteer networks, community nodes,
  earned media, founder-led narrative, door-to-door or direct-contact tactics.
- Counter-position. When the competitor saturates a channel, their saturation is your
  signal-cut-through — your absence from billboards becomes a message.
- Measurement: lift tests are still mandatory, but the metrics shift — incremental
  signups, volunteers, attendees, donors. Not CPA on cold Meta.
- **Refuse broad cold-paid.** If the user insists, explain the diminishing-returns
  curve and the Hungarian case study (see `hungarian-case-study.md`) before
  reconsidering. Most users will change their mind once they see the curve.

## How to report the verdict

Tell the user in one sentence, not a paragraph:

> "Your asymmetry is **severe** (competitor spends ~15× what you spend). This means we
> will lead with organic Tier 1–2 channels, use paid only as surgical amplification of
> proven organic winners, and run a lift test before any broad paid spend."

Then move to Stage 4.
