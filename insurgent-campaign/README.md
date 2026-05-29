# insurgent-campaign

A Claude Code skill that turns a campaign brief into a grassroots-first plan for anyone being **outspent** — startups vs. incumbents, NGOs vs. corporate comms, movements vs. state-backed machines, solo brands vs. big-budget competitors.

It refuses the default marketing-AI reflex of "content calendar plus ads plus influencer outreach." Paid spend is treated as **amplification on top of proven organic winners, never the plan itself**. Credibility and earned trust are the bottleneck; incremental lift is the only metric that counts.

> **€0 beat €4 billion.** The skill encodes the asymmetric playbook behind Hungary's 2026 grassroots-opposition result against a twenty-year, state-backed incumbent — and applies it to any fight where the spending math is rigged and the trust math is not.

## Install

```
/plugin install insurgent-campaign@bencium-marketplace
```

## What it does

Paste a brief — any length, even one sentence — and the skill runs a staged workflow:

| Stage | Output |
|---|---|
| **1. Brief intake** | Reads the brief; asks only for the fields that change the outcome, defaults the rest and flags every assumption |
| **2. Ideation** | 5+ campaign concepts across distinct archetypes (founder-story, coalition, counter-narrative, referral, community-build, …) |
| **3. Asymmetry audit** | Classifies spend asymmetry as mild / severe / categorical, then runs a six-factor preconditions check |
| **3a. Message-market-fit gate** | A **hard refusal**: if the offer is not validated, the skill stops, names the missing evidence, and routes you to a discovery cycle instead of generating a plan anyway |
| **4. Channel tier stack** | Function-first channel routing + a 70/30 (or 80/20) organic-to-paid allocation with strict boost gates |
| **5. Positioning** | Competitor saturation map + three alternative campaign shapes to choose from |
| **5b. Execution** | First-30-days action list (scaled to your real weekly capacity), ad copy + boost rules, a lift-test plan, and an anti-vanity metric dashboard |

## What makes it different

- **Anti-fabrication is a discipline, not a hope.** When the brief says "the dominant incumbent" without naming anyone, the skill refuses to quietly fill in a real company (Sentry, Datadog, HubSpot) from training data. It stays at the level of abstraction the brief gave it — across concepts, SEO keywords, and earned-media targets.
- **A real refusal mechanism.** The message-market-fit gate will decline to plan a campaign for an unvalidated offer. Distribution amplifies signal; it cannot manufacture it.
- **Measures lift, not vanity.** It insists on an incremental lift test over platform-reported ROAS, and ships six lift-test templates (geo-holdout, conversion-lift, synthetic-control, micro-lift, brand-keyword holdout, zero-budget UTM attribution).
- **Modular references, loaded on demand.** Archetypes, sector riders, asymmetry tables, channel tiers, the authenticity playbook, lift-test templates, and the Hungary case study live in separate files, pulled only when a stage needs them.
- **Orchestration-agnostic.** Ships as a Claude Code plugin, but the same files run unchanged in any agent harness that can read a prompt (Codex, Pidev, Opencode, …). Where the workflow says "ask the user," it uses your harness's structured-question facility or falls back to plain text.

## When it triggers

Campaign-planning requests — "campaign plan," "marketing strategy," "launch plan," "ad budget," "should I advertise," "paid vs organic," "grassroots," "low budget marketing," "NGO campaign," "outspent," "competitor has bigger budget," "how do I compete without money" — and, more broadly, any spend asymmetry, collapsing organic reach, rising CPAs, or a trust/credibility problem, even without the word "campaign."

## What's inside

```
insurgent-campaign/
├── .claude-plugin/plugin.json
└── skills/insurgent-campaign/
    ├── SKILL.md                       # the staged workflow + contracts
    └── references/
        ├── campaign-archetypes.md     # 15+ archetypes the ideation engine draws from
        ├── asymmetry-audit-table.md   # decision table for classifying spend asymmetry
        ├── channel-tier-stack.md      # Tier 1–4 channels with 2025–2026 benchmarks
        ├── authenticity-playbook.md   # founder voice, counter-positioning, narrative coherence
        ├── lift-test-templates.md     # six lift-test templates
        ├── sector-riders.md           # six sector-specific overlays
        └── hungarian-case-study.md    # Tisza vs. Fidesz 2026 worked example
```

## Background

The playbook rests on two evidence bases: the empirical limits of paid-media persuasion (academic field experiments such as Lewis & Rao 2015 show digital-ad ROI confidence intervals so wide that many campaigns cannot be distinguished from zero), and a worked case study of a grassroots challenger out-organizing a vastly better-funded, state-backed incumbent. The skill is explicit that the playbook wins **only when preconditions are present** — a credible insider, accumulated grievance, a consolidated challenger, felt pain, a threshold-rewarding system, and an overplaying incumbent — and names the missing ones rather than over-generalizing the case.

## Author & license

Built by [bencium.io](https://bencium.io). Part of the [bencium-marketplace](https://github.com/bencium/bencium-marketplace); released under the marketplace license.
