---
name: insurgent-campaign
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

# Insurgent Campaign

A campaign-design skill for organizations and people who cannot win by outspending. It ideates
campaign concepts across every major archetype, audits the user's spend asymmetry against
their competition, assembles an insurgent channel stack, sets strict boost gates on any
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

The skill runs in seven stages (1, 2, 3, 3a, 4, 5, 5b). Do not skip stages; later
stages depend on the user's answers and selections from earlier ones. Stage 3a
(MMF Gate) can refuse the full campaign plan and route the user to validation work
instead. Stage 5 ends with a shape selection — Stage 5b only begins once the user
has picked one of the three shapes.

This skill is designed to be portable across agent environments. Where the workflow
says "ask the user," use whatever structured-question facility your environment
provides (in Claude Code that is the `AskUserQuestion` tool, batching up to 4
questions per call); if no structured tool exists, ask in plain text and wait for
the user to reply before continuing. Either way, never invent answers.

**Resume Protocol (idempotency).** Before producing any output, scan the
conversation for prior skill output. If a section's heading (`## N. <name>`)
is already present in the conversation, do not regenerate it. Pick up at the
first stage whose Contract preconditions are satisfied AND whose output
section(s) are not yet in the conversation. If the user explicitly asks to
restart, restart from Stage 1; otherwise resume rather than rerun. This makes
the skill safely re-invokable: a second call in the same conversation produces
only the next incremental section, never duplicates or regressions to earlier
stages. Scope: idempotency holds within a single conversation; if prior output exists only in an external file or a previous session, paste it into the conversation first or restart from Stage 1.

**Stage Contracts.** Each stage below opens with a **Contract** block declaring
inputs, outputs, preconditions, postconditions, and failure modes. The contract
is the structural boundary — it is what makes the stage retry-safe, error-
explicit, and self-describing. Treat the contract as binding: if the
preconditions are not met, do not enter the stage; if a failure-mode trigger
fires, take the declared action rather than improvising.

### Stage 1 — Interview / Brief Capture

**Contract**
- Inputs: user's initial brief (free text, any length).
- Outputs: Section 0 (Assumptions table) under Mode C; mode-tag (A/B/C) and the 8 fields captured in working memory for downstream stages.
- Preconditions: none (entry stage).
- Postconditions: all 8 fields have a value (captured, defaulted, or flagged as `[ask]` for a still-pending question); mode is determined.
- Failure modes:
  - any always-capture field missing under Mode C → add it to the question batch; do not default silently.
  - a missing field would change Stage 3 asymmetry classification OR Stage 4 function choice → escalate it into the batch even if it would normally default.
  - user gives contradictory values for the same field → ask one clarifying question; do not pick one silently.

The skill has **three intake modes**. Pick the mode that matches the user's brief
before asking any questions.

**Mode A — Full-brief mode.** The user has volunteered all 8 fields below up front
(in a pasted brief, a prior plan, a detailed message). Skip the interview entirely,
confirm understanding in one sentence, and proceed to Stage 2.

**Mode B — Interview mode.** The user explicitly asks to be scoped ("help me figure
out what this campaign should be," "walk me through it," "interview me"). Ask the 8
questions below in batches of ≤4 per turn, using the environment's structured
question facility if one exists (see the structured-tool note in the Workflow
section above). Do not invent answers. Do not merge questions.

**Mode C — Default mode (for terse briefs).** The user gave a short brief
(≤2 sentences) without asking for an interview. This is the common case. Do NOT run
the full 8-question interview — it turns a 12-word prompt into an interrogation.
Instead:

1. **Always-capture fields (ask once, batched).** Four fields are too material to
   default silently; getting them wrong produces a generic plan. Ask the user in
   **one batch** of up to 4 questions covering:

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
   drop it from the question batch. Only ask what is missing.

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
   default it — add it to the question batch. Example: if the user mentions
   "our whole team is posting already" but does not specify which channels,
   ask, because it changes the channel stack.

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

**Contract**
- Inputs: 8 fields from Stage 1 (especially sector, audience, competition descriptor).
- Outputs: Section 1 (Campaign Ideas) with ≥5 concepts across distinct archetypes; an explicit ask to the user to pick one or more.
- Preconditions: Stage 1 complete; sector field has a value (named or `other`).
- Postconditions: ≥5 distinct-archetype concepts presented; user has been prompted to select.
- Failure modes:
  - competitor unnamed in brief → use `[incumbent]` placeholder or category descriptor in every concept; never invent a name.
  - cannot produce 5 genuinely distinct archetypes for this audience/sector → say so plainly, present what you have, do not pad with cosmetic variants of one archetype.
  - user's brief names one dominant player but expects industry peers → do not auto-name the obvious #2/#3; use the escape-hatch phrasings from the Industry-peer rule.

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
concepts, Stage 4 SEO, Stage 5 competitor saturation, Stage 5b earned-media
targets and ad-copy hooks, and any other downstream output. The discipline does
not relax in any later stage. "Everyone in the industry knows it exists" is not a
licence to name it.

After presenting the five concepts, ask the user to pick one (or more) to push through
Stage 3–5.

### Stage 3 — Asymmetry Audit

**Contract**
- Inputs: budget (user's + competitor's), or heuristic answers from `references/asymmetry-audit-table.md`; the concept(s) the user selected from Stage 2.
- Outputs: Section 3 (Spend Asymmetry Verdict) — one-sentence classification + preconditions score (0–6).
- Preconditions: Stage 2 complete; user has named one or more concepts to push forward.
- Postconditions: asymmetry classified as mild / severe / categorical; preconditions count is in {0..6}; downstream stages know which playbook scale to run.
- Failure modes:
  - 0–2 preconditions → name the missing ones, refuse the full playbook, route the user to building the missing preconditions as the campaign itself.
  - asymmetry numbers absent → ask the heuristic questions in the reference file; do not assume a level.
  - user gives competitor spend in a non-comparable form (e.g., revenue, headcount) → ask one clarifying question to convert to spend ratio; do not estimate silently.

Classify the user's spend asymmetry using the table in `references/asymmetry-audit-table.md`.

- If the user gave numbers: compute the ratio (competitor spend ÷ user spend) and map it
  to mild (1:2–1:5), severe (1:5–1:50), or categorical (1:50+).
- If the user did not give numbers: ask the heuristic questions from the reference file
  (state-backing? can they afford billboards? do they dominate your category's search ads?)
  and classify qualitatively.

Report back one sentence: `Your asymmetry is <level>. This means <what it means for your
strategy>.` Do not hedge. Do not offer a "balanced" recommendation if the user is at
categorical — it would be misleading.

Then run a **Preconditions Check**. The insurgent playbook wins when preconditions are
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

- **5–6 preconditions:** run the insurgent playbook at full scale. Proceed to Stage 4.
- **3–4 preconditions:** proceed, but flag the missing ones as campaign sub-goals — the
  user will need to build them during the campaign (e.g., find a credible voice, surface
  the grievance) for organic to compound.
- **0–2 preconditions:** refuse to execute the playbook at full scale. **Building the
  preconditions is the campaign.** Recruit the credible voice, consolidate the coalition,
  surface and name the grievance, find the felt-pain story. Until those are present, the
  insurgent playbook will underperform and burn the volunteer/community energy it
  depends on. Say this out loud. Do not soften it.

### Stage 3a — Message-Market-Fit Gate

**Contract**
- Inputs: three yes/no signals (revenue/commitment, audience-language, close) from the user.
- Outputs: Section 3a (3 signals + 0–3 score + explicit verdict).
- Preconditions: Stage 3 complete.
- Postconditions: verdict ∈ {3/3 proceed, 2/3 validation-cycle, 0–1/3 refuse}; downstream stages know whether to proceed, insert a validation cycle, or stop.
- Failure modes:
  - **score 0–1/3 → produce only Section 3a + refusal text; do NOT generate Sections 4–11. Route the user to a discovery cycle.**
  - score 2/3 → produce Section 3a + the validation-cycle pre-task description; allow Stage 4 only after the validation cycle is named.
  - user does not know the answer to a signal → treat that signal as a "no" (absence of evidence is evidence of absence for MMF); do not skip the question.

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
  Explain plainly: *"The insurgent playbook scales trust. It cannot
  manufacture demand for a product, event, or cause people do not already
  want. Running a full campaign now will burn the volunteer/community energy
  that Stage 5 depends on. Come back when at least 2/3 of these signals are
  present."* Do not soften this. Do not produce the full Stage 4–5 deliverable.

Report the MMF verdict at the top of the Stage 3 section of the final output so
the user sees it before the channel stack.

### Stage 4 — Channel Tier Stack + 70/30 Allocation

**Contract**
- Inputs: bottleneck (Stage 1 Q6), sector (Stage 1 Q1), asymmetry verdict (Stage 3), MMF verdict (Stage 3a).
- Outputs: Section 4 (Channel Tier Stack) + Section 5 (70/30 or 80/20 Allocation).
- Preconditions: Stage 3a verdict is `3/3 proceed` OR `2/3 with validation cycle attached`. **If verdict is `0–1/3 refuse`, this stage MUST NOT execute.**
- Postconditions: primary function chosen (demand-capture / paid-amplification / trust-compounding); sector rider applied; channels listed with weekly effort estimates; allocation split stated in plain numbers.
- Failure modes:
  - asymmetry is categorical AND user requests broad cold-paid Tier 4 → refuse, route to Tier 1/2 + counter-positioning, explain the diminishing-returns curve from `references/authenticity-playbook.md`.
  - sector = `other` → flag rider mismatch in Assumptions table, proceed with the closest rider, name which rider assumptions do not apply.
  - function choice conflicts with sector rider (e.g., B2B SaaS rider biases founder-LinkedIn, function choice is demand-capture) → surface the conflict, present both paths, do not collapse silently.

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
- **Failure-mode warning** — the sector-specific way the insurgent playbook
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
saturation map and to every Stage 5b output section (`## 8`–`## 11`): the
banned-token discipline does not relax downstream of Stage 2.

### Stage 5 — Shape Menu + Competitor Saturation Map

**Contract**
- Inputs: selected concept (Stage 2), channel stack + allocation (Stage 4).
- Outputs: Section 6 (Competitor Saturation Map) + Section 7 (Three Alternative Campaign Shapes). **No other sections.**
- Preconditions: Stage 4 complete; allocation stated.
- Postconditions: 3 shapes presented with tradeoffs; user has been explicitly asked to pick one; turn ends.
- Failure modes:
  - **end of stage reached without a shape selection from the user → end the turn with the selection ask; do NOT produce Sections 8–11.**
  - user cannot tell a Self-story (Marshall Ganz framework) → drop the founder-led shape, present community-first / earned-media-first / search-capture-first instead.
  - brief already pre-selects a shape (rare) → confirm in one sentence, proceed to Stage 5b.

Given the selected concept + channel stack, produce **only the two items below**.
Stage 5 ends with the user picking one of the three shapes; do not generate any
of the Stage 5b output (`## 8`–`## 11`) until the selection has been made.

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

**Stop point.** Output only sections `## 6` (Competitor Saturation Map) and `## 7`
(Three Alternative Campaign Shapes), then end the turn with an explicit request:
*"Pick one of the three shapes (or ask me to revise them) and I will produce the
First-30-Days plan, ad copy, lift-test, and anti-vanity dashboard."* Do not
generate `## 8`–`## 11` until the user names a shape. If the user's initial brief
already pre-selected a shape (rare), confirm that selection in one sentence and
proceed to Stage 5b.

### Stage 5b — Selected-Shape Plan

**Contract**
- Inputs: the *one* shape the user selected from Stage 5; capacity (Stage 1 Q8); paid-channel role from Stage 4 allocation.
- Outputs: Section 8 (First-30-Days Action List) + Section 9 (Ad Copy + Boost Rules, only if paid applies) + Section 10 (Lift-Test / Measurement Plan) + Section 11 (Anti-Vanity Metric Dashboard).
- Preconditions: Stage 5 complete AND a specific shape has been named by the user (by index or name).
- Postconditions: 30-day plan fits within stated capacity ceiling (cuts named if not); a single named lift-test template selected; track/ignore metrics enumerated.
- Failure modes:
  - **entered without a named shape from Stage 5 → ask for the selection; do NOT produce any Section 8–11 content.**
  - drafted weekly effort exceeds capacity ceiling → cut lowest-ROI actions until total fits; name the cuts explicitly.
  - earned-media targets unknown / not in brief → flag week-1 research as the action with explicit research method; do not invent outlet names.
  - paid does not apply in the channel stack → omit Section 9 entirely (do not produce empty/placeholder ad copy).
  - asymmetry categorical AND paid in stack → produce a counter-positioning refusal note in Section 9, not cold-paid creative.

Begin only after the user has picked one of the three shapes from Stage 5. If no
selection has been received, ask for it and stop. The four items below are
produced against the *one* selected shape — not all three.

1. **First-30-days action list** — concrete weekly actions for weeks 1–4, mapped to the chosen
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

2. **Ad copy + boost rules** — *only* if paid has a role in the chosen stack:
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
     budget. If the user is already bidding on their own brand, require a
     brand-keyword holdout test (Template 5 in `references/lift-test-templates.md`)
     before continued spend.
   - If asymmetry is categorical, refuse to produce broad cold-paid copy. Offer Tier 1/2
     content instead and explain why.

3. **Lift-test / measurement plan** — mandatory, no exceptions. One concrete experiment
   using the templates in `references/lift-test-templates.md`. Template selection:
   - **Budget exists:** Template 1 (geo-holdout) or Template 2/3 (conversion-lift).
   - **Tiny budget (<€5k), formal templates underpowered:** Template 4 (micro-lift).
   - **Brand-keyword bidding already in play:** Template 5 (brand-keyword holdout).
   - **Zero budget:** Template 6 (organic-source attribution) — directional, UTM-tagged,
     30-day window, per-channel conversion-rate ranking, cut-the-bottom-20%-reinvest-
     in-the-top decision rule.
   Specify:
   - The hypothesis (paid channel X drives incremental action Y on top of organic
     baseline — or, for Template 6, *"channel X outperforms channel Y on conversion rate
     per unique visitor"*).
   - Control vs. test group definition (or channel-comparison definition for Template 6).
   - Holdout percentage, duration, and minimum sample size.
   - The incremental metric (not attributed; not platform-reported ROAS). For Template 6,
     per-channel conversion rate, with the explicit caveat that it is directional only.
   - The decision threshold: what lift level justifies continued spend, what level means
     stop. For Template 6: top channel → double effort; bottom <20% → drop.

4. **Anti-vanity metric dashboard** — the short list of metrics the user should track and
   the longer list of metrics they should explicitly ignore. Examples:
   - Track: saves, shares, sustained watch time, signed-up volunteers/subscribers,
     incremental conversions from the lift test, word-of-mouth referrals.
   - Ignore: impressions, CPM, follower count, raw likes, platform-reported attributed
     ROAS, vanity engagement rate without segmentation.

## Output Template

Produce the final deliverable in this exact order so the user can scan it and act:

```
# Insurgent Campaign Plan — <user / project name>

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

## 6. Competitor Saturation Map  (Stage 5 output)
<per competitor: what they saturate, the absence that becomes your signal, one-sentence positioning line>

## 7. Three Alternative Campaign Shapes  (Stage 5 output — end the turn here; await shape selection)
<three shapes with tradeoffs>

## 8. First-30-Days Action List  (Stage 5b output — only after shape selection)
<week 1–4 concrete actions, scaled to stated capacity with cuts named>

## 9. Ad Copy + Boost Rules  (Stage 5b output, if paid applies)
<creative direction + 24–48h gate + frequency cap + refusal note if categorical>

## 10. Lift-Test / Measurement Plan  (Stage 5b output)
<one concrete experiment with threshold>

## 11. Anti-Vanity Metric Dashboard  (Stage 5b output)
<track list / ignore list>
```

**Completeness — do not compress the final deliverable.** This is the payload, not a
summary of it; the user should never have to run follow-up rounds to pull out the full
plan. Fill every applicable section in full prose, not headline fragments. For each
recommendation include the *why* — the mechanism, the tradeoff, the diminishing-returns
or authenticity logic behind it — not just the conclusion; the reasoning is what lets the
user hold the discipline after the run ends. Concretely: each campaign concept carries its
full thesis + archetype + primary tier + authenticity hook + MVP; the channel stack names
weekly effort per channel; the action list spells out week-by-week actions with the cuts
named; the lift test states hypothesis, control/test groups, duration, incremental metric,
and decision threshold. Brevity in *structure* (scannable headings, tables) is the goal;
brevity in *content* is a failure. If a section does not apply (e.g. no paid in the stack),
state why in one line rather than dropping it silently.

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
  Running a full insurgent campaign against a broken offer burns the volunteer,
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

## Failure Modes Quick Reference

One-page summary of the per-stage Contracts above. Use this when reviewing an
output to check whether a declared failure-mode action was actually taken.

| Stage | Trigger | Required action |
|---|---|---|
| 1 | Always-capture field missing under Mode C | Ask in the question batch; do not default silently |
| 1 | Missing field changes Stage 3 / Stage 4 outcome | Escalate into the batch even if normally defaulted |
| 2 | Competitor unnamed in brief | Use `[incumbent]` / category descriptor; never invent |
| 2 | Cannot generate 5 distinct archetypes | Say so; present what you have; do not pad |
| 3 | Preconditions score 0–2 | Refuse full playbook; route to building preconditions |
| 3 | Asymmetry numbers absent | Ask heuristic questions; do not assume a level |
| 3a | **MMF score 0–1/3** | **Produce only Section 3a + refusal; STOP — do not generate Sections 4–11** |
| 3a | MMF score 2/3 | Insert validation cycle before Section 4 |
| 3a | User does not know a signal | Treat as a "no" |
| 4 | Categorical asymmetry + broad cold-paid request | Refuse; route to Tier 1/2 + counter-positioning |
| 4 | Sector = `other` | Flag rider mismatch; proceed with closest rider |
| 4 | Function ↔ sector-rider conflict | Surface both paths; do not collapse silently |
| 5 | **End of stage without shape selection** | **Repeat the ask; STOP — do not produce Sections 8–11** |
| 5 | User cannot tell Self-story | Drop founder-led shape; route to community / earned-media / search |
| 5b | Entered without named shape | Ask for selection; do not produce any Section 8–11 |
| 5b | Drafted effort exceeds capacity | Cut lowest-ROI actions; name the cuts |
| 5b | Earned-media targets unknown | Flag week-1 research with method; do not invent outlets |
| 5b | Paid does not apply in stack | Omit Section 9; do not produce placeholder copy |
| 5b | Categorical asymmetry + paid in stack | Produce counter-positioning refusal in Section 9, not cold-paid creative |

## References (read when relevant)

- `references/campaign-archetypes.md` — 15+ archetypes the ideation engine draws from.
- `references/asymmetry-audit-table.md` — decision table for classifying spend asymmetry.
- `references/channel-tier-stack.md` — Tier 1–4 channels with 2025–2026 benchmark data.
- `references/authenticity-playbook.md` — founder voice, kitchen-table framing,
  counter-positioning, narrative coherence.
- `references/lift-test-templates.md` — six lift-test templates (geo-holdout, conversion-lift, synthetic-control, micro-lift, brand-keyword holdout, zero-budget UTM).
- `references/sector-riders.md` — six sector-specific overlays applied in Stage 4.
- `references/hungarian-case-study.md` — Tisza vs. Fidesz 2026 worked example.
