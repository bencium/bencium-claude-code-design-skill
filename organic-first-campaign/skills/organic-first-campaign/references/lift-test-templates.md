# Lift-Test Templates

Stage 5 of `SKILL.md` requires a concrete measurement plan for any paid spend. Platforms
report *attributed* conversions — conversions correlated with an ad view. What the user
needs is *incremental* conversions — conversions that would not have happened without
the ad. The gap between these two numbers is often the entire ad spend.

## Why platform ROAS cannot be trusted

Platform attribution systems are optimized for the platform's revenue, not the user's.
A conversion attributed to Meta might have happened from organic search, from a word-of-mouth
referral, or from the user typing the URL directly — Meta's pixel fires as long as the
person scrolled past an ad in the last N days. This is why meta-analyses of ad-effectiveness
experiments consistently show that attributed ROAS overstates incremental ROAS by 2–10×.

The academic evidence is sharper still. Lewis & Rao's "The Unfavorable Economics of
Measuring the Returns to Advertising" (*Quarterly Journal of Economics*, 2015) ran 25
large-scale digital ad field experiments and showed that even well-powered tests often
cannot statistically distinguish the campaign's true ROI from zero — the confidence
intervals are wider than the effect sizes almost every advertiser wants to claim. In
plain language: on the evidence the user has, most paid campaigns cannot be proven to
work better than not running them. The dashboard showing "4.2× ROAS" is describing
activity, not causality.

Platforms know this. Both Meta (Conversion Lift, Brand Lift) and Google (Conversion Lift,
Search Lift) ship holdout-based experimentation tools *themselves*. The fact that the
platforms distinguish "attributed" from "incremental" in their own product naming is the
tacit admission. Use their tools, or build your own (Templates 1–3 below). When a user
pushes back on the discipline — "my ads are working, I can see the numbers" — cite Lewis
& Rao and the platforms' own product naming. The burden of proof is on the claim of
lift, not on the demand for evidence.

## Template 1 — Geo-holdout experiment

Best for: local businesses, multi-market products, political campaigns, anything with
natural geographic segmentation.

### Design

1. **Pick two or more comparable regions.** Comparable means similar population,
   demographics, baseline sales/signups/turnout. Example pairs: two mid-size metros in the
   same country, two neighborhoods with similar profiles, two US states with similar
   political baselines.
2. **Designate one as "test" (ads run), one as "holdout" (no ads).** If you can run
   more than two regions (e.g., 4 test + 4 holdout), statistical power improves significantly.
3. **Run the paid campaign only in the test region for at least 4 weeks.** Shorter
   durations produce noisy results; longer durations confound with seasonality.
4. **Measure the outcome metric in both regions before, during, and after the
   campaign.** Outcome metric should be *real* (sales, signups, donations, votes, attendance),
   not platform-reported (clicks, impressions, attributed conversions).
5. **Compute the lift.** Lift = (test region post-campaign − test region baseline) −
   (holdout region post-campaign − holdout region baseline). This difference-in-differences
   estimate is the causal effect of the paid spend.

### Minimum viable version

- 2 regions, 4 weeks, simple before/after comparison of total sales or signups.
- Small sample sizes produce wide confidence intervals. Be honest about this — a noisy
  result is often indistinguishable from zero effect, which is itself a meaningful finding
  (and should stop the spend).

### Decision thresholds

- If incremental lift is at least 2× the cost of the spend: continue.
- If lift is positive but smaller than spend cost: rethink creative or channel; do not
  scale.
- If lift is statistically indistinguishable from zero: stop the spend. Move budget to
  organic Tier 1–2.

## Template 2 — Conversion-lift (audience-holdout) experiment

Best for: digital-native businesses where the audience can be randomly split within a
platform's ad system.

### Design

1. **Within the target audience, platform holds out a random subset (typically 10–30%) from
   seeing ads.** Meta, Google, and TikTok all offer this through their lift-test tooling.
2. **The holdout sees no ads for the campaign duration; the treatment group sees them
   normally.**
3. **Platform reports the incremental conversion rate** — the difference in conversion
   rate between treatment and holdout — which is the causal effect.

### Setup requirements

- Minimum audience size: usually tens of thousands of users for reliable signal. Smaller
  campaigns produce noisy lift estimates.
- Campaign budget: usually at least $10k spend, sometimes more, to move the metric enough
  to detect lift above noise.
- Duration: typically 4–6 weeks.

### Decision thresholds

- Compare incremental lift to attributed ROAS. Expect incremental to be 20–70% of
  attributed. If incremental is less than 20% of attributed, the campaign is largely
  claiming credit for conversions that would have happened anyway — stop or rework.
- If incremental ROAS clears the cost-of-capital threshold (typically 1.5–2× spend
  depending on margin), continue. Otherwise reallocate.

## Template 3 — Pre-post with synthetic control

Best for: single-market campaigns where geo-holdout is not possible (one country only, one
city only).

### Design

1. **Before launching the paid campaign, gather at least 8–12 weeks of baseline data on
   the outcome metric.**
2. **Identify a "synthetic control"** — a combination of other markets, other brand keywords,
   or other product lines that track your baseline metric well historically. Software like
   Google's CausalImpact or simple regression can construct this.
3. **Run the campaign. Measure the outcome metric and compare to the synthetic control's
   projection.** The gap is the estimated lift.

### Caveats

- Synthetic-control methods are sensitive to unobserved confounders (seasonality, external
  events, competitor moves). Interpret lift estimates with wider confidence bands.
- Works best when the outcome metric has low noise relative to the expected lift.

## Template 4 — Micro-lift for tiny campaigns

Best for: very small budgets (under €5k) where the formal templates above are statistically
underpowered.

### Design

1. **Run the paid campaign for 2 weeks.**
2. **Ask converters directly:** during the signup / purchase / donation flow, add one
   question — "How did you hear about us?" — with a short list of options including "saw
   an ad."
3. **Compare ad-attributed shares to organic shares.** This is not a rigorous causal test,
   but it is a cheap signal check: if only 2% of converters credit the ad, the ad is
   probably not doing much regardless of what the platform reports.

### When to use

- Budgets too small for statistical lift tests.
- Campaigns where the downside of a noisy estimate is acceptable.
- As a *supplementary* signal alongside a formal test, not a replacement.

## Anti-patterns to refuse

The skill should refuse to accept these as measurement plans and explain why:

- **"We'll just track ROAS in the Meta dashboard."** Attributed, not incremental.
  See above.
- **"We'll A/B test two creatives to see which performs better."** Creative comparison
  is not a lift test. It tells you which creative is less bad, not whether either creates
  incremental lift.
- **"We'll measure follower growth during the campaign."** Follower growth is confounded
  with everything — organic activity, press, time of year. Not causal.
- **"We'll measure sentiment."** Sentiment tools are noisy and sentiment correlates
  poorly with action. Useful as a directional check, not a decision threshold.

## Pairing with the 24–48h organic traction gate

The organic-traction gate from `channel-tier-stack.md` (do not boost a post until it has
demonstrated organic signal) and the lift tests here are complementary, not redundant.

- The **organic gate** decides *what to boost* — only proven winners.
- The **lift test** decides *whether boosting works at all* at meaningful scale.

A campaign running both disciplines will burn less budget on ineffective spend than a
campaign running either alone.

## Output in the deliverable

In Stage 5 of `SKILL.md`, produce a specific, named experiment from one of these templates.
Not "set up some form of lift testing." A template like:

> **Geo-holdout: 4-week experiment**
> - Test region: Budapest (run all paid Meta spend here)
> - Holdout region: Debrecen (no paid spend)
> - Metric: newsletter signups (daily count pulled from Supabase)
> - Duration: April 20 – May 18
> - Decision threshold: continue spend only if Budapest signups are at least 1.8× the
>   difference-in-differences delta vs. spend cost. Stop if delta is within noise.

Specificity is the whole point. A vague measurement plan is no measurement plan.

## Template 4 — Brand-keyword holdout test

Best for: established brands, SaaS, e-commerce, anyone currently bidding on their own
brand name in Google Ads (or Bing / other search networks).

### Why this test matters

Blake, Nosko & Tadelis ran a large-scale field experiment at eBay and found **weak or no
measurable short-term benefit from search ads bidding on the company's own brand name**.
The users clicking a "Ebay.com" paid search result would have arrived via the organic
result directly below it anyway. Brand-keyword ad spend was substantially cannibalizing
free traffic — paying for clicks that would have happened for free.

This is one of the single most reliable ways established brands waste paid budget.
Platform-reported ROAS on brand keywords is always excellent *because* the traffic would
have converted regardless. The lift vs. no-ad condition is the honest number.

### Design

1. **Identify the brand-keyword campaign.** The exact-match and phrase-match ads bidding
   on the company name, product names, and common misspellings.
2. **Pick matched geographic regions.** Same rules as Template 1 — comparable population,
   demographics, baseline organic search volume for the brand. Minimum 30% of national
   traffic in the test region.
3. **Pause brand-keyword bidding in the test region for 4 weeks.** Keep all other paid
   campaigns running identically in both regions. Keep all organic SEO identical.
4. **Measure total conversions** (signups, purchases, whatever matters) in both regions —
   *not* just paid conversions. The question is whether total business output changes, not
   whether paid-attributed conversions change (of course they will, to zero).
5. **Compare the difference-in-differences.** Did total conversions drop in the test
   region relative to the control region?

### Decision threshold

- **No measurable drop (within noise):** the brand-keyword spend was cannibalizing free
  traffic. Kill the campaign. Redirect budget to trust-compounding organic or to
  non-brand demand-capture search terms where lift is real.
- **Measurable drop > cost of spend:** the campaign was actually producing incremental
  traffic. Keep it, but retest quarterly — competitor bidding on your brand name changes
  the answer, as does your own organic SEO strength.
- **Measurable drop < cost of spend:** partial cannibalization. Kill it anyway — you are
  paying more than the incremental value.

### Common failures

- Running the test for one week. Brand searches have weekly cyclicality; run four weeks
  minimum.
- Cutting all paid spend, not just brand-keyword. Confounds the result.
- Ignoring organic rank. If your organic result is #1 for brand queries, cannibalization
  is near-total; if you rank #4 behind three competitors bidding on your name, the test
  might reveal real lift from defensive bidding.
- Not segmenting by query type. Your company name alone is different from
  "company-name reviews" or "company-name vs competitor-name." Test each segment
  separately.

### Why this template belongs in Stage 5

Stage 5 of `SKILL.md` forbids broad cold-paid for severe / categorical asymmetry. For mild
asymmetry users, the single most common paid mistake is brand-keyword overspend. This
template catches it. Run this test before any other paid-search expansion.

## Template 5 — Organic-source attribution (zero-budget)

Best for: campaigns with no paid budget at all. Every Tisza-style campaign, early-stage
startup, NGO push, solo practitioner, and any underdog at categorical asymmetry.

### Why this template matters

Templates 1–4 all assume some paid spend to test against a holdout. Zero-budget campaigns
have no holdout axis — there is no "paid on" vs. "paid off" comparison possible. But
measurement is still mandatory. Without source-level attribution, the user cannot tell
whether LinkedIn is driving the campaign or the newsletter is, which means they cannot
cut the weakest channel or redouble on the strongest one.

This template substitutes *between-channel* comparison for *with-vs-without* comparison.
It is directionally useful, not causally conclusive. Say that out loud — the user
should not treat these numbers as proof of lift, only as proof of relative organic channel
strength.

### Design

1. **UTM-tag every link the campaign publishes.** Every LinkedIn post CTA, every
   newsletter link, every podcast-show-notes mention, every QR code on a flyer, every
   referral link. Naming scheme: `utm_source=<channel>` (linkedin, newsletter, podcast-
   <show-slug>, referral-<advocate>), `utm_medium=organic`, `utm_campaign=<campaign-
   name>`.
2. **Set up segmented landing-page analytics.** The conversion (application submitted,
   newsletter signup, event registration, donation) must be tracked by UTM source. Most
   analytics tools (Plausible, PostHog, Simple Analytics, Supabase + custom) handle this
   natively.
3. **Run for 30 days minimum.** Shorter windows under-sample weekly cyclicality and over-
   weight one-off viral posts.
4. **Rank channels by conversion rate per unique visitor**, not by absolute conversion
   volume. A newsletter with 2,000 subscribers and 50 conversions outperforms a LinkedIn
   post with 50,000 impressions and 80 conversions (2.5% vs. 0.16%).
5. **Segment by content type within each channel.** A LinkedIn Live might convert
   dramatically better than a text post, which changes the weekly-effort allocation in
   Stage 5.

### Decision rule

- **Top channel:** double weekly effort on it next 30 days.
- **Any channel <20% of top channel's conversion rate:** drop it unless it serves a
  secondary function (credibility, SEO backlink, borrowed audience) the measurement
  cannot see.
- **Middle band:** maintain effort, retest after any format change.
- **Overall conversion rate across all channels <0.5%:** the bottleneck is upstream of
  channel selection — usually message-market fit or an offer problem. Re-run the MMF
  gate in Stage 3a before re-investing in distribution.

### Caveat — this is directional, not causal

Without a randomized holdout, you cannot prove any channel *caused* its conversions
versus correlating with a user who would have converted anyway. Someone who signed up
via the newsletter link may have first heard about the event on LinkedIn and later
clicked through an email — multi-touch attribution is underspecified in this template.
Treat the rankings as a rough guide to effort allocation, not as proof of lift. If the
campaign later gets any budget, graduate to Template 1 (geo-holdout) for real lift
measurement.

### Why this template belongs in Stage 5

Zero-budget campaigns are the default case for the organic-first skill. Without a
zero-budget template, Stage 5 would either demand a paid test the user cannot run or
quietly drop the measurement requirement. Template 5 fills that gap.
