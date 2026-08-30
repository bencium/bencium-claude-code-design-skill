# Production System

Read this only after the human has explicitly locked one typography-led HTML design direction. Inject its Round 1 concept capsule as the governing context for concrete Round 2 artifacts and production rules.

## No SVG

Never create SVG. Do not author, generate, edit, trace, convert to, export, or recommend SVG as artwork, logo, icon, diagram, editable master, intermediate file, web markup, or final deliverable.

Use formats according to the real medium:

- **Editable graphic source:** lean HTML and CSS when practical.
- **Digital review and delivery:** lossless PNG by default; WebP or JPEG when file size, transparency, or photographic content justifies it.
- **Print delivery:** verified PDF at the required size, bleed, color space, and production settings.
- **Interfaces:** project-native HTML, CSS, and application code, with raster screenshots only as review evidence.

If a logo, cutting path, fabrication file, or other deliverable genuinely requires a professionally drawn scalable vector master, write a precise construction and production brief and state that qualified human vector work remains. Do not claim completion by generating SVG path code.

An existing user-supplied or licensed third-party SVG can be treated as immutable input after human approval. Do not alter, trace, inline, redistribute, or derive new SVG from it. Record its provenance and license separately.

## Preserve the visual constitution

Write the constitution before creating tokens or components. It should state:

- the subject-derived premise;
- the compositional law;
- typography behavior and acquisition status;
- color-generating logic;
- spatial rhythm and density;
- the locked margins, padding, gaps, gutters, type roles, scale, case, alignment, and whitespace behavior from the concept capsule;
- shape, line, edge, and boundary behavior;
- materiality and permitted imperfection;
- imagery behavior, if approved;
- motion behavior, if relevant;
- locked traits that make the language recognizable;
- permitted variation;
- mutations that would return it to a familiar platform or AI default;
- accessibility, cultural, legal, and production boundaries.

Use specific instructions that can decide future work. Avoid adjectives that could describe any brand.

## Choose the smallest useful system

Build for the artifacts the human actually needs. Do not create an enterprise design system for a poster, a component library for a short publication, or a brand platform before the visual language has proved it can travel.

Separate:

- **locked rules**, which preserve identity;
- **responsive or contextual rules**, which adapt to medium and content;
- **open decisions**, which remain under human judgement.

Never fix a 12-column grid, spacing scale, type ratio, card anatomy, modal layout, breakpoint set, easing curve, or component hierarchy across unrelated projects. Derive them from the committed language and real use.

## Tokens follow form

Create tokens only for decisions that need consistent reuse. Token names should express a project-specific role or behavior, not copy a framework's default vocabulary without thought.

When digital production needs tokens, provide:

- CSS custom properties for the real implementation;
- a portable structured representation when another tool or agent must consume them;
- descriptions of purpose and allowed variation;
- accessible pairs and state relationships where relevant;
- provenance linking each token group to the visual constitution.

Do not invent a complete scale to fill a template. A token set may be small, irregular, asymmetric, or medium-specific when the language requires it.

## Typography and fonts

Record:

- family, designer or foundry, and primary source;
- exact styles, axes, and files required;
- license holder, scope, price, renewal terms, and restrictions;
- language and glyph coverage;
- web, app, desktop, print, social, and redistribution rights as applicable;
- loading, fallback, and performance behavior;
- what remains unverified or unpurchased.

Do not present a paid typeface as available until acquisition is approved and the necessary license exists. Do not silently substitute Google Fonts.

## Icons, marks, and imagery

Use an existing icon family when it can serve the committed language and functional requirements. Evaluate its drawing logic, optical behavior, coverage, accessibility, license, delivery method, and ability to coexist with the constitution. Do not select it because it is popular or free. If it is supplied only as SVG, treat the approved upstream asset as immutable; do not create or modify SVG files or inline SVG markup.

Create a logo or wordmark only if the brief requires one. Do not force a visual world to collapse into a logo.

For photography, illustration, or generated imagery, define subject, framing, light, material, color relationship, repetition, cropping, imperfection, exclusions, and rights. Imagery implements the constitution; it does not become a moodboard that rewrites it.

## Interaction and motion

Derive interaction behavior from the actual task, risk, frequency, input method, and committed character.

- Direct manipulation needs keyboard-accessible and precise alternatives.
- Dragging needs a non-drag method.
- Gestures need visible controls when the action matters.
- Destructive or lossy actions need prevention and recovery.
- A modal must not close on outside interaction when unfinished work could be lost.
- Automatic themes, hidden features, or adaptive behavior require a product reason and approval.
- Motion must preserve meaning under reduced-motion settings.

Do not use hover lift, marquee, counters, parallax, spring motion, or any other effect by default.

## Proof artifacts

Choose a small set of real artifacts that test the language where it will live. Use real content and real constraints. Depending on the project, this may include a campaign format, publication spread, package face, social crop, identity application, responsive page, complex workflow state, or motion sequence.

One master artifact is not proof that the language can travel. One component library is not proof that it has character. Test both identity and use.

Use the original prompt to determine the artifact set and count. If it requested three items, rebuild those same three with the real copy. Do not substitute new concepts or expand the set without approval. Give the rebuilt artifacts to the human and ask whether the locked direction's character survived. Human approval, not successful rendering, authorizes freezing.

## Freeze and continue

After explicit human approval:

- freeze the approved source files, outputs, and generation rules as the production baseline;
- record invariant traits, allowed variations, rejected mutations, and reopening conditions;
- distinguish approved content from any remaining placeholders;
- preserve the font, asset, and license status without overstating what is cleared;
- explain the immediate next steps in plain language;
- create and link a human-readable HTML style guide based on the locked visual direction;
- tell the human that they may request any further artifact from the approved language.

Do not create additional artifacts merely because they are possible. Wait for an explicit request. New artifacts inherit the frozen constitution and generation rules; they do not reopen creative direction unless the human says so.

## HTML style guide

After the approved artifacts and generation rules are frozen, create `STYLEGUIDE.html` as a self-contained, browser-openable document. Use lean HTML and CSS, preserve the no-SVG rule, and express the guide through the locked visual language rather than a neutral documentation template.

Include every applicable production rule already established by the locked capsule and constitution:

- subject-derived premise, source boundary, and intended character;
- exact fonts, sources, license status, fallbacks, language coverage, roles, styles, axes, sizes, weights, widths, grades, optical sizes, case, tracking, word spacing, line height, line length, kerning, ligatures, hyphenation, punctuation, numerals, diacritics, and multilingual behavior;
- color values, roles, proportions, combinations, contrast boundaries, and non-color cues;
- hierarchy, reading path, copy sequencing, dominance, repetition, and language behavior;
- margins, padding, gaps, gutters, columns, text-block widths, indents, alignment, baseline behavior, edge relationships, density, rhythm, whitespace, overlap, cropping, and vertical type;
- shape, line, edge, material, imagery, icon, and motion rules when the approved artifacts use them;
- interaction, responsive behavior, states, accessibility, and recoverability rules when the system is interactive;
- artifact formats, real-content rules, generation commands, and allowed contextual adaptation;
- locked invariants, permitted variation, prohibited normalization, rejected mutations, and reopening conditions;
- asset provenance, font and media licensing, verification status, remaining placeholders, open production risks, and what has not been tested.

Use real examples from the approved artifacts when they clarify a rule, but do not turn the guide into a gallery or introduce new design ideas. The guide records the system; it does not redesign it.

Tell the human that `STYLEGUIDE.html` was created, link the file, summarize what it governs, and state that any further artifact may now be requested from the locked visual language.

## Handoff prompt examples

Include these as copyable examples in `STYLEGUIDE.html` and adapt the bracketed fields to the project without rewriting user-provided copy:

**Create another artifact**

> Read `ROUND-2-CONTEXT.md` and `STYLEGUIDE.html`. The visual direction is locked. Create [artifact and quantity] for [real format or channel] using the exact copy below. Preserve the frozen invariants and generation rules. Do not generate alternative directions or import a new style. [Exact copy]

**Adapt an approved artifact**

> Adapt [approved artifact path or name] to [dimensions, medium, or channel]. Keep the visual direction locked and preserve its hierarchy, typography, color behavior, rhythm, and signature relationships. Change only what the new format requires. Report any rule that cannot survive the adaptation before replacing it.

**Revise without reopening**

> Revise [artifact path or name] to solve [specific problem]. Keep the chosen direction locked. Preserve [named qualities that must survive]. Do not propose another concept or change unrelated generation rules. Return the revised artifact for human judgement and state exactly what changed.

**Continue in a new thread**

> Read [absolute path to `ROUND-2-CONTEXT.md`] and [absolute path to `STYLEGUIDE.html`] before working. Treat them as the governing context. The visual direction and approved generation rules are frozen. Create [requested artifact] with the exact content and production constraints below. Do not reopen A through J unless I explicitly ask. [Exact content and constraints]

**Extend the system**

> Using `ROUND-2-CONTEXT.md`, `STYLEGUIDE.html`, and the approved artifacts, add rules only for [new artifact type, state, medium, imagery, motion, or interaction]. Preserve all existing invariants. Update the HTML style guide with only the newly approved rules after I accept the result.

Keep the examples short enough to copy. Explain that paths, artifact names, quantities, formats, exact copy, and production constraints should replace the brackets.

## Project-local ledger

Offer the ledger after the direction is locked and create it only with human approval. Keep it small and editable. Store it with the project, never as a global gallery or cross-client inspiration store.

Record:

- premise and allowed evidence;
- signature traits;
- committed decisions;
- open questions in a separate section;
- rejected mutations and why they failed;
- accessibility, cultural, legal, and licensing boundaries;
- conditions that may reopen the direction;
- the explicit human lock and later overrides.

Do not store sensitive user material, licensed assets, private references, or personal data in shared agent memory.

## Handover

Deliver actual source files when the workspace supports them. Otherwise provide:

- the constitution;
- asset and license manifest;
- implementation-ready tokens where needed;
- artifact specifications;
- production instructions;
- verification status;
- a short list of unresolved work in priority order.

State the proof level precisely. A production system is available only when the necessary rules, assets, rights, implementation, and verification for the agreed scope exist.

End the handover by naming the next human decision. Before approval, ask the human to judge the rebuilt real-copy artifacts. After approval and freezing, create and link `STYLEGUIDE.html`, tell the human that another concrete artifact may be requested from the locked visual language, and include copyable prompt examples for the current or a new thread.
