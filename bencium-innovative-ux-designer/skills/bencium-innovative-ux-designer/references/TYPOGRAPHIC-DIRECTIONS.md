# Typographic Directions

This document is the single authority for round one. It covers the evidence
gate, the divergence matrix, the ten specimens, their hard exclusions, the file
contract, the direction capsules, the rejection pass, the first presentation,
and the lock. SKILL.md states the laws; the operational detail lives only here.

## Minimum-evidence gate

The first directions need a generative seed, not a completed creative brief.
Default to zero questions. Proceed when the existing message provides:

- **Subject:** enough real context to know what the work belongs to;
- **Intent:** an audience, desired effect, central tension, or meaningful proposition.

Treat the user's own words, proposition, and tensions as the seed. Infer what is
already present before asking anything. Do not make the user repeat information
or supply extra history merely to satisfy a process.

Ask only when the subject or intent is fundamentally unclear, two plausible
readings would create opposite work, or an assumption risks harm or false
representation. Ask no more than two short questions in one batch. Do not
explain the whole workflow, announce a phase, estimate completion time, or
present an intake form. Do not ask a second question batch before showing round
one. Resolve remaining uncertainty with reversible assumptions.

Do not ask the human to choose from style categories, favorite designers, or
websites. If an aesthetic adjective is load-bearing and unclear, ask what
concrete behavior, feeling, memory, or situation it names; otherwise infer a
testable interpretation and proceed.

## Defer production facts

Before round one, do not collect information merely because it will matter
eventually. Defer:

- final copy, offers, dates, legal text, and calls to action;
- every output channel, dimension, crop, quantity, schedule, and budget;
- complete participant biographies, public permissions, and credits;
- photography plans and complete asset inventories;
- printing specifications, implementation stacks, and vendor details;
- full accessibility and regulatory requirements beyond any known immediate boundary.

Ask early only when omission would make the specimen harmful, falsely attribute
a real person, expose private information, or make visual comparison impossible.
Production readiness is not the goal of round one.

Use anonymous roles or unmistakable placeholders when identities are unresolved.
Never invent personal facts. Preserve exact user-provided copy; when no final
wording exists, use minimal provisional working copy and disclose it after the
first visual reaction.

## Evidence capsule

Record what is already known:

- a factual subject summary;
- audience and context;
- first-party language and content;
- a small number of high-value observations;
- tensions or contradictions worth preserving;
- any medium or production constraint that actually changes round one;
- accessibility and cultural boundaries;
- allowed and prohibited sources;
- unresolved questions.

Do not delay direction work to fill every field. Privately derive at least ten
possible typographic premises, then select ten that depend on different subject
relationships. Do not show written premises before the first visual reaction.

## Divergence matrix

Random difference is arbitrary; ten fonts on one layout is not ten directions.
Constrained divergence means every direction answers the same real brief through
a different causal premise **and** a different formal composition.

Fill this table completely before writing any HTML. One row per direction, one
column per formal axis:

| | premise | alignment | case rule | columns | density | scale contrast | canvas/text colour | vertical placement | overlap / vertical type | voice |
|---|---|---|---|---|---|---|---|---|---|---|
| A | | | | | | | | | | |
| … | | | | | | | | | | |
| J | | | | | | | | | | |

Rules:

- Every cell is filled before any specimen exists.
- **No column may repeat a value more than twice across the ten rows.**
- A row sharing more than three cells with another row is rebuilt from the
  evidence capsule. Leave the other row alone; never make a direction safer to
  create separation.
- Each `premise` is used once, and each traces to a distinct relationship in the
  evidence capsule.
- **Fonts are chosen after the matrix is filled.** The typeface answers a
  composition that already exists; it never substitutes for one.
- `voice` values: continuous, interrupted, compressed, ceremonial,
  conversational, forceful, restrained, quiet.

The matrix is internal working state. It is not a design board, and it is not
shown at the first presentation — seeing the axes would prime the human's
judgement of the specimens.

Do not create A and then modify it into B through J. Begin each row from the
evidence capsule with no reuse of another direction's typographic decisions.

## The ten specimens

Create one professional typography-only specimen per row, using the same working
content and the same canvas. The specimen must make a possible visual language
perceptible without turning it into an artifact, illustration, labelled design
board, or fake campaign.

Every direction must integrate:

1. **Font voice:** one typeface or a deliberate combination, with clear display,
   supporting, and small-text roles where the working copy needs them.
2. **Font relationship:** serif, sans, slab, script, display, monospaced, or
   hybrid behavior selected from subject-derived requirements rather than a
   style menu.
3. **Size scale:** a distinct proportional relationship between primary,
   secondary, supporting, caption, date, number, attribution, and minor language
   where present.
4. **Case behavior:** deliberate uppercase, lowercase, title case, sentence
   case, small capitals, or mixed case.
5. **Font behavior:** genuine weight, width, grade, optical size, italic, slant,
   or variable-font axes; never artificial deformation.
6. **Typographic detail:** intentional letter spacing, word spacing, line
   height, line length, kerning, ligatures, hyphenation, punctuation, alignment,
   and line breaks.
7. **Language coverage:** considered numerals, diacritics, abbreviations, and
   multilingual text where present.
8. **Palette behavior:** one flat canvas plus primary, secondary, and accent
   letterform colors used in clear proportions and relationships. Color may
   change between textual roles and inside a word when the change carries
   meaning or hierarchy. Never present color as disconnected swatches, and never
   as a panel, band, box, or background area.
9. **Space and placement:** deliberate outer margins, internal padding, gaps,
   gutters, text-block widths, maximum widths, column count and proportions,
   indents, hanging punctuation, baseline offsets, alignment, vertical
   placement, and edge relationships.
10. **Whitespace and rhythm:** deliberate silence, density, symmetry or
    asymmetry, repetition of supplied language, placement, and scale changes.
    Large uninterrupted areas of whitespace are compositional material.
11. **Hierarchy:** an intentional reading path that remains legible at normal
    size and convincing at thumbnail size.
12. **Signature relationship:** one memorable interaction between language,
    type, color, and space derived from subject evidence and capable of
    extending into later artifacts.

Preserve every supplied word exactly. A direction may change sequence,
dominance, line breaks, or repeat supplied language when doing so does not alter
meaning. Explore whether the voice feels continuous, interrupted, compressed,
ceremonial, conversational, forceful, restrained, or quiet by changing type and
space rather than adding visual objects. Let rhythm from the subject become line
rhythm, repetition, spacing, or scale.

## Hard exclusions

Every visible pixel is either a letterform or the single flat canvas
background. Invisible HTML and CSS layout may position and space the type.

- no shapes, lines, rules, borders, frames, panels, bands, blobs, or circles;
- no illustration, imagery, photography, icons, symbols, or logo marks;
- no gradients, textures, grain, shadows, glow, blur, filters, or decorative effects;
- no pseudo-elements or punctuation used to imitate shapes;
- no animation or motion;
- no artificial stretching, warping, skewing, or distortion of letterforms;
- no simulated poster, campaign, website, packaging, or social-media artifact;
- no SVG or canvas.

Also excluded as inputs: UI libraries, animation libraries, design-token
packages, icon libraries, and generated imagery. Round one is dependency-free
HTML and CSS.

Three things remain available because they are typesetting, not decoration:

- `::first-letter`, `::first-line`, and `content`-based hanging punctuation —
  the pseudo-element exclusion covers shape imitation, not typographic detail;
- `writing-mode` for vertical type, which is not a transform;
- ordinary overflow cropping and controlled overlap.

All three are allowed only while the typography stays readable and
professionally typeset. Never turn letterforms into abstract illustration.

Use genuine font variants and axes for weight, width, optical size, grade,
italic, and slant. The SVG ban continues after round one: never convert a
selected direction into SVG, use SVG as an editable master, or solve a difficult
composition by generating path data.

Use one canvas across all ten specimens. Do not simulate a poster, campaign,
publication, package, interface, device, billboard, social-media post, or
production mockup. Artifact conventions would contaminate judgement of the
typography itself.

The specimen is not a moodboard, style tile, swatch sheet, annotated foundation
board, abstract illustration, interface, component sheet, or finished brand
guideline. It should feel like a disciplined typographic proposition: resolved
enough for human judgement, open enough to become a visual language after
selection.

Typography, alignment, spacing, cropping, optical balance, and rendering must be
professionally resolved. Do not add category labels, a direction name, or an
explanation before visual judgement.

## File contract

```text
round-1/
  A.html … J.html        one specimen each, dependency-free
  index.html             all ten at equal viewing size
  capsules/A.md … J.md   written during round 1, withheld until reaction
ROUND-2-CONTEXT.md       written at project root on lock
```

All ten share one canvas and one set of working copy. Default canvas: 1600 ×
1000 CSS pixels, a neutral proportion belonging to no artifact genre. Override
it only when the medium genuinely requires a different one, and then use the
overridden size for all ten.

The `ROUND-2-CONTEXT.md` path is fixed so a Round 2 continuation, or a fresh
session, can find its governing context without guessing.

## Direction capsules

Create one concise Markdown capsule beside every specimen. It records the
direction so later work does not depend on visual memory or an improvised
prompt:

- subject-derived premise;
- exact font or combination, primary source, license status, and fallback status;
- hierarchy and type roles;
- size, case, weight, width, grade, optical size, italic or slant, tracking,
  spacing, line, punctuation, and language rules;
- canvas and text-color values with their roles, including any color change
  inside a word or between textual roles;
- margin, padding, gap, gutter, column, text-block, alignment, edge, density,
  repetition, overlap, cropping, and whitespace rules;
- signature typographic relationship;
- candidate invariants, allowed variation, and prohibited normalization;
- provisional assumptions and unresolved risks;
- translation instructions for concrete Round 2 artifacts.

Write neutral operational prose. Do not use style names, mood words, prestige,
external references, or persuasive claims. Save the capsules as part of round
one, but withhold them from the first visual encounter.

## Composition-level rejection pass

Run the mechanical exclusion check in
[VERIFICATION.md](VERIFICATION.md) first — it catches what prose cannot. Then
inspect each direction at thumbnail size, normal viewing size, and close range.
Reject it if any of these are true:

- another organization's name could replace the real one without breaking the work;
- it contains any non-typographic element;
- it simulates a poster, hero section, campaign asset, logo, moodboard, style
  tile, or other artifact genre;
- the focal point comes from decoration or an effect rather than language and type;
- typography, color, and space tell unrelated stories;
- it shows color without palette behavior or typefaces without typographic behavior;
- alignment, spacing, clipping, or optical balance looks accidental or unfinished;
- it becomes equivalent to another direction when only the font or palette changes;
- it needs a confident paragraph to seem intelligent;
- it sacrifices necessary comprehension merely to look experimental;
- its rules cannot produce a second composition in the same language.

Rebuild only the failed direction, starting again from its matrix row and the
evidence capsule. Do not make the others safer to match it.

## First presentation

Present ten separate specimen renders with equal visual status. Label them only
A through J.

Do not include:

- direction names;
- mood words;
- rationales or claimed meanings;
- source explanations;
- font names or foundry prestige;
- the divergence matrix;
- implementation notes;
- buttons, scoring controls, forms, a comparison dashboard, shapes, lines,
  illustrations, icons, device frames, or production mockups.

Ask the human for an immediate response in ordinary language. Useful questions
are:

- Which one remains in your mind when you look away?
- Which one feels alive rather than merely competent?
- What specific part feels true or false?
- Does one deserve to be developed, or did the premise fail?

After the human gives this unprimed response, reveal the neutral direction
capsules only for the directions they want to consider. Do not bury the human
under all ten texts unless they request them.

## When no direction is selected

Treat rejection as evidence. Identify whether the failure came from missing
subject knowledge, a weak premise, false cultural assumptions, an inappropriate
medium, insufficient divergence, or poor execution.

Ask the smallest number of new questions required, revise the evidence capsule,
build a new divergence matrix, and create a new set of ten. Do not preserve a
rejected specimen. Do not increase the batch beyond ten.

## Selection and lock

Interest, praise, a shortlist, or a request for refinement is not a lock. Before
locking, keep any requested refinement typography-only and preserve the same
round-one boundary.

When the human explicitly locks one direction:

- terminate the other nine;
- preserve its HTML, rendered preview, and capsule;
- add the human's corrections and locked decisions without rewriting the
  original premise;
- copy the capsule into `ROUND-2-CONTEXT.md` at the project root;
- use that document as governing context for every concrete artifact.

## Round 2: concrete artifacts

Build what the project actually needs rather than another abstract specimen.
Depending on the brief, Round 2 may produce a working component library and
representative screens, campaign formats, publication pages, packaging,
environmental pieces, presentations, motion, or another concrete artifact
family.

Shapes, lines, photography, illustration, generated imagery, icons, material
effects, or motion may enter only after the lock and only when required by the
artifact or approved by the human. Derive them from the locked typographic
context and prevent them from importing a second style.

For interfaces, build real components with real states, content, responsive
behavior, keyboard access, visible focus, and recoverability. A component
library must be usable implementation, not a decorative component sheet. For
graphic artifacts, use real dimensions, content, and medium constraints.

Use `ROUND-2-CONTEXT.md` in every Round 2 handoff or continuation. If a new task
or production process cannot access the project files, include the capsule in
its input. Do not replace it with a short aesthetic adjective.

Build in the existing project stack when one exists. Continue with HTML and CSS
plus rendered PNG, WebP, or JPEG evidence when practical. Never create SVG
during development or handoff.

After the lock, do not volunteer more directions. Record any later reopening
reason and the human decision that authorized it. Read
[PRODUCTION-SYSTEM.md](PRODUCTION-SYSTEM.md) before building the production
system.
