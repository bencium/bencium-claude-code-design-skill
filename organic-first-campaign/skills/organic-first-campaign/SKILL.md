---
name: organic-first-campaign
description: >
  Grassroots-first campaign design for anyone being outspent — startups vs. incumbents,
  NGOs vs. corporate comms, movements vs. state-backed machines, solo brands vs.
  big-budget competitors. Ideates awareness, launch, fundraising, mobilization,
  community-build, counter-narrative, referral, founder-story, and coalition campaigns.
  Triggers on "campaign plan", "marketing strategy", "ad budget", "should I advertise",
  "paid vs organic", "launch plan", "grassroots", "low budget marketing", "NGO campaign",
  "outspent", "competitor has bigger budget", "how do I compete without money". Also
  trigger on any spend asymmetry, collapsing organic reach, rising CPAs, or a
  trust/credibility problem — even without the word "campaign". Nudge activation when
  the user debates buying ads, boosting posts, or hiring influencers; they are likely
  about to burn money on a channel that will not persuade.
---

# Organic-First Campaign

A campaign-design skill for organizations and people who cannot win by outspending. It ideates
campaign concepts across every major archetype, audits the user's spend asymmetry against
their competition, assembles an organic-first channel stack, sets strict boost gates on any
paid spend, and produces a lift-test plan so the user measures incremental impact rather
than vanity metrics.

## Core Premise

**Paid media scales attention. Organic narrative and grassroots networks scale trust.**
When trust is the bottleneck — and in 2025–2026, for most underdogs, it is — additional
ad spend hits diminishing and then negative returns. Saturation, inauthenticity, and narrative
incoherence produce reactance, not persuasion. The leverage point is not reach; it is credibility
and message-market fit.

Empirical spine:

- Academic field experiments show digital ad ROI confidence intervals are so wide that most
  campaigns cannot be statistically distinguished from zero lift (Lewis & Rao, "The
  Unfavorable Economics of Measuring the Returns to Advertising," *Quarterly Journal of
  Economics* 2015). Meta and Google both ship Conversion Lift / Brand Lift tools precisely
  because *they* distinguish attributed conversions from incremental conversions — the
  platforms' own tooling is the tacit admission that dashboard ROAS is not causal.
- Across 18,000+ brands, CPA rose in 13/14 industries in 2025; ROAS fell in 13/14; conversion
  rates fell in 13/14. More money is buying fewer results.
- Facebook organic engagement sits near 0.15%, Instagram ~0.50%, X ~0.15%, TikTok ~2.50% — still
  the best organic window but compressing fast.
- Meta and Google both ended political/issue ads in the EU in October 2025, removing paid channels
  entirely for large categories and forcing organic to carry the campaign.
- Under the most extreme spending asymmetry imaginable (a grassroots party vs. a €4B state-backed
  communications apparatus with foreign support), the side with near-zero paid media won a
  parliamentary supermajority in Hungary in April 2026 — see `references/hungarian-case-study.md`.

The same curve bends commercial advertising. The skill treats paid as an *amplifier of proven
organic winners*, never as a standalone channel.

## When to Apply This Skill

Apply when the user:

- Asks to plan any campaign (marketing, launch, fundraising, mobilization, awareness, turnout).
- Describes being outspent by a competitor, incumbent, or adversary.
- Is considering ad spend, boosts, influencer deals, or scaling a paid channel.
- Is watching their organic reach collapse and wondering what to do.
- Is preparing for a launch, election, fundraise, product push, or cause-led moment.
- Is deciding between paid and organic allocation, or between channels.

Also apply when no explicit "campaign" is named but the user is debating where to invest
time and money for distribution.

## Workflow

The skill runs in six stages (1, 2, 3, 3a, 4, 5). Do not skip stages; later stages
depend on the user's answers and selections from earlier ones. Stage 3a (MMF Gate)
can refuse the full campaign plan and route the user to validation work instead.

### Stage 1 — Interview / Brief Capture

The skill has **three intake modes**. Pick the mode that matches the user's brief
before asking any questions.

**Mode A — Full-brief mode.** The user has volunteered all 8 fields below up front
(in a pasted brief, a prior plan, a detailed message). Skip the interview entirely,
confirm understanding in one sentence, and proceed to Stage 2.

**Mode B — Interview mode.** The user explicitly asks to be scoped ("help me figure
out what this campaign should be," "walk me through it," "interview me"). Ask the 8
questions below via `AskUserQuestion` in batches of ≤4 per call. Do not invent
answers. Do not merge questions.

**Mode C — Default mode (for terse briefs).** The user gave a short brief
(≤2 sentences) without asking for an interview. This is the common case. Do NOT run
the full 8-question interview — it turns a 12-word prompt into an interrogation.
Instead:

1. **Always-capture fields (ask once, batched).** Four fields are too material to
   default silently; getting them wrong produces a generic plan. Send **one**
   `AskUserQuestion` call with up to 4 questions covering:

   - **Outcome** — what specific action is the campaign driving (signups, ticket
     sales, votes, donations, attendance, pre-orders, qualified demos)?
   - **Audience** — who is the target? Who experiences the problem? Geography,
     seniority, community membership. "Everyone interested in AI" is not an
     audience; "London-based senior AI/ML engineers at Series A–C startups" is.
   - **Sector** — pick from the 6 riders in `references/sector-riders.md`
     (`cohort-education`, `b2b-saas`, `ngo`, `consumer-brand`, `political-civic`,
     `personal-brand`), or `other` with a one-sentence description. The sector
     rider materially changes Stage 4 channel weighting and Stage 5 archetype
     defaults.
   - **Budget** — what can you actually spend per month (€0 / <€1k / €1k–10k /
     €10k+) and what is the competitor's rough spend (unknown / similar / 5×
     ours / 50×+ ours)? Budget materially changes Stage 3 asymmetry
     classification and Stage 4 paid-channel availability. Never default this
     silently.

   If one of these four fields is already clearly present in the user's brief,
   drop it from the `AskUserQuestion` call. Only ask what is missing.

2. **Default-with-flag fields.** The remaining fields default silently but are
   surfaced in an **Assumptions table** at the top of the final deliverable (Stage
   5 output). The user can confirm or adjust inline after reading the plan:

   | Field | Default under terse brief |
   |---|---|
   | Competition (specifics) | Abstract — "cohort-based courses in the category," "mid-size SaaS competitors," etc. Use the heuristic questions in `references/asymmetry-audit-table.md` to classify asymmetry qualitatively. Never invent specific competitor names. |
   | Existing channels / traction | "Starting from zero" unless the user's brief, working directory, or CLAUDE.md clearly indicates an existing newsletter, community, or follower base. |
   | Bottleneck | Trust (the 2025–2026 default for almost every underdog campaign). |
   | Time window | 60 days to a single dated anchor moment (event, launch, election), then recurring cadence. |
   | Capacity | 6h/week. |

3. **Escalation rule.** If a missing field would materially change the Stage 3
   asymmetry classification *or* the Stage 4 primary-function choice, do not
   default it — add it to the `AskUserQuestion` call. Example: if the user
   mentions "our whole team is posting already" but does not specify which
   channels, ask, because it changes the channel stack.

4. **Assumptions table is mandatory under Mode C.** Open the final deliverable
   with a table listing every defaulted field and its assumed value. End the
   deliverable with: *"Confirm or adjust any row in the Assumptions table and I
   will re-run the affected stages."*

#### The 8 Fields

Regardless of mode, the campaign plan is grounded in these 8 fields:

1. **Sector and outcome** — which of the 6 sector riders applies, and the specific
   action the campaign drives. (Sector is ask-once in Mode C; outcome is
   ask-once in Mode C.)
2. **Audience** — who is the target, with enough specificity to picture them.
   (Ask-once in Mode C.)
3. **Competition / incumbent** — name 3–5 specific competitors, *or* say "unknown"
   / "I'll describe them abstractly." If unknown, stay at category level and use
   `references/asymmetry-audit-table.md` heuristics. Never invent names.
   (Defaults in Mode C; user can sharpen in the Assumptions confirmation.)
4. **Budget** — user's and competitor's, in numbers or rough ratios.
   (Ask-once in Mode C.)
5. **Existing channels and traction** — where does the user already reach the
   audience (newsletter size, community size, follower counts that matter, warm
   email list, prior press). (Defaults in Mode C.)
6. **Bottleneck** — reach / trust / conversion / turnout / retention — pick one.
   (Defaults to trust in Mode C.)
7. **Time window** — evergreen / 30 / 60 / 90 days / tied to a dated event or
   launch. (Defaults to 60 days in Mode C.)
8. **Capacity** — realistic hours per week. Hard-constrains Stage 5's first-30-days
   action list; lowest-ROI actions get cut until total weekly effort fits.
   (Defaults to 6h/week in Mode C.)

### Stage 2 — Ideation (generate 5+ campaign concepts across archetypes)

Before any audit or channel work, generate **at least five distinct campaign concepts**,
drawn from different archetypes in `references/campaign-archetypes.md`. Do not converge
early. The point is to give the user a shaped menu to choose from.

For each concept, produce:

- **Name** — short, memorable, in the user's voice.
- **One-line thesis** — why this campaign works for *this* user against *this* competitor
  *right now*.
- **Archetype** — which archetype it draws from (e.g., founder-story arc, counter-narrative,
  earned-media stunt, referral flywheel, community-build, coalition play).
- **Primary channel tier** — which tier from `references/channel-tier-stack.md` this
  concept leans on (Tier 1/2/3/4).
- **Authenticity hook** — the specific real-world detail, person, story, or action that makes
  it credible and hard to fake.
- **Minimum viable version** — the smallest possible execution that proves the concept works
  in two weeks or less.

**Anti-fabrication rule for concept names, theses, and hooks.** If the user named a
specific competitor in the brief, use the name. If the user said "well-known incumbent,"
"market leader," "the dominant player," or otherwise did not name one, **do not fill in
the blank with your best guess.** Stay at the level of abstraction the brief gave you.
Use the category descriptor (e.g., "the $400-per-seat monitor"), the behavior
("the enterprise billing tax"), or a bracketed placeholder (`[incumbent]`) that the user
will fill in. Concept names like "We Quit Sentry" or "DataDog Alternative" — invented
from the category description rather than the brief — violate the Stage 1 anti-fabrication
rule and must not appear in Stage 2 output. This applies equally to SEO keyword lists,
earned-media pitch hooks, and any downstream section that inherits the concept name.

**Industry-peer rule.** The anti-fabrication rule covers *any* competitor name absent
from the brief — not only invented names, but widely-known industry peers to a
brief-named incumbent. If the brief names one dominant player (e.g., the user says
"we're outspent 100x by [market leader]"), do **not** add the obvious #2 or #3 from
the same category on your own ("LexisNexis and Westlaw," "Salesforce and HubSpot,"
"Datadog and New Relic") as if their presence were implied context. Use escape-hatch
phrasing instead: "the other major [category] platforms," "[incumbent]-class tools,"
or "the dominant [category] incumbents." This applies in every section — Stage 2
concepts, Stage 4 SEO, Stage 5 competitor saturation, Stage 7 dialogue, Stage 8
earned-media targets. "Everyone in the industry knows it exists" is not a licence to
name it.

After presenting the five concepts, ask the user to pick one (or more) to push through
Stage 3–5.

### Stage 3 — Asymmetry Audit

Classify the user's spend asymmetry using the table in `references/asymmetry-audit-table.md`.

- If the user gave numbers: compute the ratio (competitor spend ÷ user spend) and map it
  to mild (1:2–1:5), severe (1:5–1:50), or categorical (1:50+).
- If the user did not give numbers: ask the heuristic questions from the reference file
  (state-backing? can they afford billboards? do they dominate your category's search ads?)
  and classify qualitatively.

Report back one sentence: `Your asymmetry is <level>. This means <what it means for your
strategy>.` Do not hedge. Do not offer a "balanced" recommendation if the user is at
categorical — it would be misleading.

Then run a **Preconditions Check**. The organic-first playbook wins when preconditions are
present; asymmetry alone is not enough. Score the user's situation against the six factors
that made the Hungarian case work (see `references/hungarian-case-study.md` for the full
mechanism). Ask or infer:

1. **Credible insider / founder-story / defector equivalent.** Is there a real person whose
   authenticity the competitor cannot manufacture?
2. **Accumulated grievance or unmet demand.** Is there anger the incumbent has ignored long
   enough that it only needs a vehicle?
3. **Consolidated challenger field.** Is the user the one clear alternative, or one of many?
   Fragmented fields dilute organic narrative.
4. **Felt pain, not abstract pain.** Does every target experience the cost directly
   (price, time, trust, service failure), or is the grievance distributed?
5. **Threshold-rewarding market / platform / system.** Does the distribution system reward
   consolidation once a share crosses some threshold (network effects, category leadership,
   algorithm-bound attention, electoral math)?
6. **Incumbent overplaying a fear / saturation hand.** Is the competitor running past the
   curve — more ads, more fear, more polished content — in a way the user can
   counter-position against?

Score 0–6. Tell the user the count plainly and what it implies:

- **5–6 preconditions:** run the organic-first playbook at full scale. Proceed to Stage 4.
- **3–4 preconditions:** proceed, but flag the missing ones as campaign sub-goals — the
  user will need to build them during the campaign (e.g., find a credible voice, surface
  the grievance) for organic to compound.
- **0–2 preconditions:** refuse to execute the playbook at full scale. **Building the
  preconditions is the campaign.** Recruit the credible voice, consolidate the coalition,
  surface and name the grievance, find the felt-pain story. Until those are present, the
  organic-first playbook will underperform and burn the volunteer/community energy it
  depends on. Say this out loud. Do not soften it.

### Stage 3a — Message-Market-Fit Gate

Before assembling a channel stack, verify the campaign is solving a **distribution
problem, not an MMF problem**. Distribution amplifies signal; it cannot manufacture
it. A founder's great LinkedIn post cannot sell a product nobody wants, and a
movement's best volunteer network cannot turn out voters for a message that does not
name their pain.

Ask the user three yes/no questions. Do not skip any. If the user does not know the
answer to one, treat that as a "no" — absence of evidence is evidence of absence for
MMF.

1. **Revenue/commitment signal:** Have ≥10 people in the target audience paid,
   signed up, pre-registered, or directly asked (without your prompting) for what
   you are offering? For events: ≥10 past attendees or paid waitlist. For products:
   ≥10 customers or pre-orders. For movements: ≥10 signed volunteers/members.
2. **Language signal:** Can you name a **specific pain the audience articulates in
   their own words** before you pitch them? Not a pain you infer — a sentence
   someone in the audience has actually said, written, or posted about.
3. **Close signal:** If you asked 5 people in the target audience to commit today
   (at the intended price / format / ask level), would at least 3 say yes?

Scoring:

- **3/3 — MMF confirmed.** The campaign is a distribution problem. Proceed to
  Stage 4.
- **2/3 — Borderline.** Name the weak link and insert a **1–2 week validation
  cycle** into the plan as a pre-campaign task *before* running the full Stage
  4–5 playbook. Examples: if question 2 fails, do 5 customer discovery
  conversations and extract the language; if question 1 fails, run a paid
  waitlist or pre-order test. Revisit the MMF gate after the validation cycle.
- **0–1/3 — Refuse the full campaign plan.** MMF is the bottleneck, not
  distribution. Route the user to a discovery cycle: 5 structured customer
  conversations, a pre-order or paid-waitlist test, a small-room live demo.
  Explain plainly: *"The organic-first playbook scales trust. It cannot
  manufacture demand for a product, event, or cause people do not already
  want. Running a full campaign now will burn the volunteer/community energy
  that Stage 5 depends on. Come back when at least 2/3 of these signals are
  present."* Do not soften this. Do not produce the full Stage 4–5 deliverable.

Report the MMF verdict at the top of the Stage 3 section of the final output so
the user sees it before the channel stack.

### Stage 4 — Channel Tier Stack + 70/30 Allocation

**Function before cost.** Before picking channels, pick the campaign's primary function
against the user's bottleneck (from Stage 1 Q6). Use the function table at the top of
`references/channel-tier-stack.md`:

- **Demand capture** — bottleneck is "people already want this, they can't find us."
  Primary function for small or unknown challengers with addressable existing intent.
  Leads with non-brand Google Search, SEO, directory presence. Never brand-keyword
  bidding without a lift test (see Stage 5).
- **Paid amplification** — bottleneck is "our organic content works but reaches too few
  people." Primary function only *after* organic winners exist (24–48h traction gate).
  Leads with retargeting, warm lookalikes, Spark Ads on proven TikTok content.
- **Trust compounding** — bottleneck is "people find us, sometimes click, but don't
  convert, refer, or come back." Primary function for the majority of underdog
  campaigns. Leads with Tier 1: founder content, community nodes, newsletters, volunteer
  networks.

A mild-asymmetry user with a trust bottleneck should not be routed to paid amplification
just because they can afford it. Route by function first; allocate within that function
by cost/asymmetry second.

**Apply the sector rider.** After the function choice but *before* allocation, open
`references/sector-riders.md` and apply the rider matching the user's sector
(captured in Stage 1). The rider adjusts:

- **Archetype defaults** — which campaign archetypes fit this sector best (e.g.,
  cohort-education biases toward community-build + referral flywheel; B2B SaaS
  biases toward founder-LinkedIn + demand capture).
- **Channel weighting** — which Tier 1/2 channels compound fastest in this sector
  (e.g., consumer brands lean on UGC flywheels; political campaigns lean on ground
  game and counter-media; NGOs lean on volunteer networks + earned media on
  named-beneficiary stories).
- **Failure-mode warning** — the sector-specific way the organic-first playbook
  underperforms when misapplied, which becomes a standing warning in Stage 5's
  anti-vanity dashboard.

Do not overwrite the function-first choice. The rider *layers on top*. If the
rider and the function choice conflict (e.g., B2B SaaS rider biases toward
founder-LinkedIn but the function choice is demand capture), surface the conflict
and name both paths rather than collapsing to one.

If the user picked "other" for sector, flag the mismatch in the Assumptions table
and proceed with the closest rider — naming which of the rider's structural
assumptions do not apply.

Then assemble the channel stack using `references/channel-tier-stack.md`. Allocation
rules layer on top of the function choice and the sector rider:

- **Mild asymmetry** → stack can include Tier 1, 2, 3, and selective Tier 4. Allocate ~70%
  effort to organic (Tier 1 + 2), 30% to paid amplification (Tier 3, with rare Tier 4).
- **Severe asymmetry** → Tier 1, 2, and targeted Tier 3. Avoid broad Tier 4. 80/20 split
  toward organic is often safer.
- **Categorical asymmetry** → Tier 1 and 2 only. Refuse to draft broad cold-paid Tier 4
  creative — it will not work and it will burn runway. If the user insists, explain the
  diminishing-returns curve and the counter-positioning move (see `references/authenticity-playbook.md`)
  before reconsidering.

Output the stack as a prioritized list with: (a) the primary function chosen, (b) the
channels mapped to that function, (c) an estimated weekly effort commitment per channel,
(d) the 70/30 (or 80/20) split in plain numbers.

**Anti-fabrication carries through.** The Stage 2 anti-fabrication rule applies to
every element of the Stage 4 output: SEO keyword examples, long-tail query lists,
directory/review-site references, competitor saturation descriptions, and any sample
copy shown inline with the stack. If the brief did not name the incumbent, the
incumbent's proper noun must not appear in this stage **in any casing** — not
title-case ("Sentry alternative"), not lowercase ("sentry alternative"), not
hyphenated, not as part of a compound keyword or URL. Search-query examples that
would otherwise require a brand name must either retain the `[incumbent]` bracketed
placeholder for the user to fill in, or be rewritten as non-brand equivalents
("error monitoring for small teams," "application monitoring under $100/seat",
"lightweight APM for node.js"). This applies equally to Stage 5's competitor
saturation map and Stage 6–10 content: the banned-token discipline does not
relax downstream of Stage 2.

### Stage 5 — Alternative Shapes, Ad Copy, Boost Rules, Measurement

Given the selected concept + channel stack, produce:

1. **Competitor saturation map.** Before shapes, before ad copy, before anything: for
   each of the top 2 named competitors (or top 2 competitor *categories* if the user did
   not name specific ones — see Principles), produce:

   (a) **What they saturate** — the channels, visual style, message tropes, production
   value, and emotional register the competitor is flooding. Be specific: "paid-heavy
   LinkedIn carousels with stock illustrations and growth-hack CTAs," not "social
   media ads."

   (b) **The absence that becomes your signal.** What is the competitor doing that your
   *refusal* to do becomes the positioning? Worked examples:
   - "Fidesz saturated billboards → Tisza's absence from billboards was the message."
   - "Cohort bootcamps saturate paid LinkedIn funnels + affiliate links → our refusal
     to advertise and our free open curriculum is the message."
   - "SaaS competitors saturate agency-produced demo videos → our terminal-only
     raw-footage weekly changelog is the message."

   (c) **One-sentence positioning line** the user commits to holding across the
   campaign. This is the single sentence every piece of content must reinforce.

2. **Three alternative campaign shapes** for executing the concept, with tradeoffs. Examples
   of shapes: *community-first* (start with 100 real people, grow through word of mouth),
   *earned-media-first* (one newsworthy action drives press + organic amplification),
   *search-capture-first* (dominate long-tail high-intent queries where demand already
   exists). Use the `alternative-generator` pattern — do not collapse to one recommendation
   prematurely; let the user choose. Each shape must include at least one flagship piece
   of content structured as **Self / Us / Now** (Marshall Ganz's organizing framework —
   see `references/authenticity-playbook.md`): the leader's lived experience, the shared
   community reality, and the specific time-bound ask. If the user cannot tell their Self
   story, drop the founder-led shape and route to community-first, earned-media-first, or
   search-capture-first instead.

3. **First-30-days action list** — concrete weekly actions for weeks 1–4, mapped to the chosen
   shape. Each action has an owner (if multiple people), an effort estimate, and a clear
   success signal.

   **Capacity is a hard constraint.** After drafting the week-by-week list, sum total
   weekly effort. If it exceeds the user's stated capacity (Stage 1 Q8, default 6h/week),
   cut the lowest-ROI actions until total effort fits inside the ceiling. Name the cuts
   explicitly: "I am cutting X and Y because the draft came to 14h/week and you said
   6h/week. These are the actions to re-add if you can carve out more time later."
   Do not ship a plan the user cannot execute.

   **Earned-media actions must be specific or flagged.** Every earned-media action in
   the list must include:
   - (a) A **named target** (e.g., "Latent Space podcast, The Pragmatic Engineer
     newsletter"), *or* an explicit "target TBD — research is the week-1 action" flag.
     Never pitch "5 podcasts in the niche" without naming them; that is not an action,
     that is a wish.
   - (b) A **one-sentence pitch hook** matched to the target's recent content — not a
     generic bio blast.
   - (c) **Success criteria** — reply, mention, guest spot, cross-post, podcast booking,
     or newsletter feature.
   - (d) **Outreach day and channel** — Tuesday morning via email, Thursday via LinkedIn
     DM, etc.

   If the skill does not know specific targets in the user's niche (because the user did
   not name them and the skill cannot invent names — see Principles), assign target
   research as the week-1 action and set success criteria for the research itself
   (e.g., "produce a ranked list of 15 targets with RSS + contact channel by Friday").

   **Community-build is a multi-week sub-campaign, not a line item.** If a Slack /
   Discord / WhatsApp / Circle community node is in the channel stack, it gets its own
   block in the first-30-days list, not one line at 1h/week:
   - **Week 0 (before public announcement):** pick the platform, write the rules, seed
     with 10 personal invites from the user's existing network. Dead rooms are worse
     than no room.
   - **Weeks 1–2:** founder posts daily for 14 consecutive days. Non-negotiable.
     Without the founder's daily presence, the community never reaches escape velocity.
   - **Weeks 3–4:** hand off three recurring rituals (weekly thread, AMA cadence, member
     spotlight) to 2–3 engaged early members. If no members step up, the community will
     die when the founder stops; surface this as a validation failure, not a staffing
     problem.
   - **Month 2+:** budget 3–4h/week sustained — moderation, weekly post, member welcomes,
     pruning dead accounts. Underinvest and the community dies.

4. **Ad copy + boost rules** — *only* if paid has a role in the chosen stack:
   - Creative direction in the user's authentic voice (see `references/authenticity-playbook.md`).
   - The explicit **24–48h organic traction gate**: do not boost a post until it has
     demonstrated genuine organic signal (saves, shares, sustained watch time, thread-depth
     comments — not raw likes). Likes are cheap and lie.
   - Audience definition: warm retargeting first, lookalikes second, cold audiences only for
     proven winners with a lift-test plan attached.
   - Frequency cap and creative refresh cadence to avoid fatigue (see ad fatigue section in
     `references/channel-tier-stack.md`).
   - **Do not bid on your own brand-name keywords without a lift test.** Blake, Nosko &
     Tadelis's eBay field experiment (2015) found weak or no incremental lift from brand-
     keyword bidding — the traffic arrives organically anyway. Platform-reported ROAS on
     brand keywords is always excellent *because* the traffic would have converted
     regardless. This is one of the most reliable ways established brands waste paid
     budget. If the user is already bidding on their own brand, require a geo-holdout
     test (Template 4 in `references/lift-test-templates.md`) before continued spend.
   - If asymmetry is categorical, refuse to produce broad cold-paid copy. Offer Tier 1/2
     content instead and explain why.

5. **Lift-test / measurement plan** — mandatory, no exceptions. One concrete experiment
   using the templates in `references/lift-test-templates.md`. Template selection:
   - **Budget exists:** Template 1 (geo-holdout) or Template 2/3 (conversion-lift).
   - **Brand-keyword bidding already in play:** Template 4 (brand-keyword holdout).
   - **Zero budget:** Template 5 (organic-source attribution) — directional, UTM-tagged,
     30-day window, per-channel conversion-rate ranking, cut-the-bottom-20%-reinvest-
     in-the-top decision rule.
   Specify:
   - The hypothesis (paid channel X drives incremental action Y on top of organic
     baseline — or, for Template 5, *"channel X outperforms channel Y on conversion rate
     per unique visitor"*).
   - Control vs. test group definition (or channel-comparison definition for Template 5).
   - Holdout percentage, duration, and minimum sample size.
   - The incremental metric (not attributed; not platform-reported ROAS). For Template 5,
     per-channel conversion rate, with the explicit caveat that it is directional only.
   - The decision threshold: what lift level justifies continued spend, what level means
     stop. For Template 5: top channel → double effort; bottom <20% → drop.

6. **Anti-vanity metric dashboard** — the short list of metrics the user should track and
   the longer list of metrics they should explicitly ignore. Examples:
   - Track: saves, shares, sustained watch time, signed-up volunteers/subscribers,
     incremental conversions from the lift test, word-of-mouth referrals.
   - Ignore: impressions, CPM, follower count, raw likes, platform-reported attributed
     ROAS, vanity engagement rate without segmentation.

## Output Template

Produce the final deliverable in this exact order so the user can scan it and act:

```
# Organic-First Campaign Plan — <user / project name>

## 0. Assumptions  (required under Mode C — default mode; omit under Mode A/B)
<table: field → assumed value, flagging every default applied from Stage 1 so the user can confirm or adjust inline at the end>

## 1. Campaign Ideas (5+ concepts across archetypes)
<concepts with thesis, archetype, primary tier, authenticity hook, MVP>

## 2. Selected Concept
<the one (or more) the user picked>

## 3. Spend Asymmetry Verdict
<mild / severe / categorical, one sentence explaining what it means>

## 3a. Message-Market-Fit Gate
<3-question score, verdict (confirmed / borderline / failed), and — if borderline or failed — the validation cycle the user must run before proceeding>

## 4. Channel Tier Stack
<prioritized channel list with weekly effort>

## 5. 70/30 (or 80/20) Allocation
<organic % / paid %, with rationale>

## 6. Competitor Saturation Map
<per competitor: what they saturate, the absence that becomes your signal, one-sentence positioning line>

## 7. Three Alternative Campaign Shapes
<three shapes with tradeoffs>

## 8. First-30-Days Action List
<week 1–4 concrete actions, scaled to stated capacity with cuts named>

## 9. Ad Copy + Boost Rules  (if paid applies)
<creative direction + 24–48h gate + frequency cap + refusal note if categorical>

## 10. Lift-Test / Measurement Plan
<one concrete experiment with threshold>

## 11. Anti-Vanity Metric Dashboard
<track list / ignore list>
```

## Principles to Hold Throughout

- **Do not sell reach as persuasion.** Reach above the first 5–6 impressions does not persuade;
  it annoys. Say this out loud when recommending frequency caps.
- **Do not propose broad cold-paid as a primary channel for severe or categorical asymmetry.**
  It will not work. Refuse and explain the alternative.
- **Do not generate content that impersonates authenticity the user does not have.** If there
  is no real founder, no real volunteer network, no real earned-media hook, say so and
  propose how to build one — do not fake it with AI-generated "real-looking" content.
- **Do not accept platform-reported ROAS as proof.** Insist on an incremental lift test.
  Platforms are graded on attributed conversions; the user is graded on actual lift.
  Academic field experiments (Lewis & Rao 2015, QJE) show digital ad ROI confidence
  intervals are so wide most campaigns cannot be distinguished from zero. Meta and Google
  ship Conversion Lift / Brand Lift precisely because they admit this. Cite the work when
  a user pushes back.
- **Always produce alternatives, not a single recommendation.** The user has information you
  do not; give them a shaped menu and let them choose.
- **Explain the why.** When refusing a paid push or a channel, explain the diminishing-returns
  curve, the counter-positioning move, or the fatigue dynamic. A user who understands the
  mechanism will hold the discipline after the skill run ends.
- **Do not invent specifics the user did not give.** No made-up competitor names, no
  fabricated budgets, no invented past-campaign references, no hallucinated podcasts or
  newsletters in the user's niche. If the user did not name them, stay abstract ("cohort-
  based courses in the category," "mid-size SaaS competitors with paid-growth teams") and
  say what you are doing: "I am describing competitors at the category level because you
  did not name specific ones — name them if you want sharper positioning."
- **Vague earned-media targets produce vague results.** Force specificity (named target,
  matched hook, success criteria, outreach day) or flag research as a week-1 action.
  "Pitch 5 podcasts" is not a plan.
- **A plan the user cannot execute is not a plan.** Respect stated weekly capacity;
  name the cuts required to fit inside it. A 6h/week plan that succeeds beats a 14h/week
  plan that collapses in week 3.
- **If MMF is failing, the campaign is the wrong problem to solve. Say so.** Distribution
  amplifies signal; it cannot manufacture it. If the MMF gate (Stage 3a) returns 0–1 / 3,
  refuse the full campaign plan and route the user to a discovery / validation cycle.
  Running a full organic-first campaign against a broken offer burns the volunteer,
  community, and founder-attention capital the playbook depends on.
- **Do not over-generalize the Hungarian case.** Organic beats paid saturation *when
  preconditions are present*: credible insider, accumulated grievance, consolidated
  challenger, felt pain, threshold-rewarding system, overplayed incumbent. Absent most of
  these, the playbook alone will not win — name the missing preconditions and recommend
  building them first.
- **Propaganda and paid advertising sit on the same curve.** Troll farms, state
  disinformation, and commercial ad buys all operate on one diminishing-returns curve and
  all face the same authenticity collapse at saturation. You can buy reach; you cannot buy
  belief; above a threshold, buying more reach makes belief harder. The troll farms have
  not gone away — they have learned this lesson too and will adapt (smaller networks,
  embedded authenticity, parasocial mimicry). Design for the adapted adversary, not the
  2020-era one: lean on verifiable authenticity (real people, real places, real time),
  narrative coherence, and provenance signals the adversary cannot manufacture without
  being caught.

## References (read when relevant)

- `references/campaign-archetypes.md` — 15+ archetypes the ideation engine draws from.
- `references/asymmetry-audit-table.md` — decision table for classifying spend asymmetry.
- `references/channel-tier-stack.md` — Tier 1–4 channels with 2025–2026 benchmark data.
- `references/authenticity-playbook.md` — founder voice, kitchen-table framing,
  counter-positioning, narrative coherence.
- `references/lift-test-templates.md` — geo-holdout and conversion-lift experiment templates.
- `references/sector-riders.md` — six sector-specific overlays applied in Stage 4.
- `references/hungarian-case-study.md` — Tisza vs. Fidesz 2026 worked example.
