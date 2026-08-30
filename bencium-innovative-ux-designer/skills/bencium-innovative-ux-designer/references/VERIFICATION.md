# Verification

Verification asks whether the chosen language survives its real medium. It does not decide whether the language deserves to exist; the human makes that judgement.

Use real content and real rendering when verifying concrete Round 2 artifacts. Mock material can support early prototyping only when clearly labelled. It cannot prove production quality.

## Proof levels

Report these independently:

1. **Typography direction selected:** the human identified a Round 1 specimen worth considering after unprimed visual judgement.
2. **Direction locked:** the human explicitly made one concept capsule the governing context for Round 2.
3. **Round 2 artifact system available:** the agreed concrete artifacts, reusable rules, assets, licenses, implementation, and verification exist.

Do not collapse source complete, render complete, system complete, and human acceptance into one claim.

## SVG invariant

Before completing any phase, inspect the generated files and source. The skill must not have created:

- `.svg` files;
- inline `<svg>` markup;
- SVG path data or `data:image/svg+xml` content;
- instructions naming SVG as an editable master, intermediate format, or export target.

Document any approved third-party SVG as immutable external input. Its presence does not authorize editing, tracing, inlining, redistribution, or derived SVG output.

## Round 1 HTML verification

Round 1 is verified as source and browser-openable HTML, not as a set of image exports. Confirm that:

- `A.html` through `J.html` exist and open as ten separate dependency-free designs;
- `index.html` links to all ten neutrally without restyling, cropping, ranking, or turning them into cards or controls;
- every direction uses the same working copy but has its own materially different palette, typography, hierarchy, margins, padding, alignment, density, rhythm, reading path, and whitespace logic;
- every visible pixel comes from letterforms or one flat canvas background;
- the source contains no shapes, borders, rules, panels, pseudo-elements, gradients, effects, imagery, icons, motion, SVG, or canvas;
- the type remains readable and professionally composed at normal and narrow browser widths;
- `capsules/A.md` through `capsules/J.md` exist but remain withheld until the human gives an unprimed visual response;
- Round 1 contains no PNG, WebP, JPEG, PDF, screenshot, contact sheet, thumbnail, or other image export.

The author may inspect the pages in a browser, but must not turn screenshots into Round 1 deliverables. Do not claim that a source check proves production quality; Round 1 is intentionally pre-production.

## Interface verification

Confirm access to the running interface before testing it. Verify the actual implementation rather than an isolated mock when production quality is claimed.

Test the agreed scope with:

- real content, including the longest likely text and empty or missing content;
- relevant viewport widths chosen from actual audience and container needs rather than a universal breakpoint list;
- keyboard-only use, logical focus order, visible and unobscured focus, skip paths where needed, and no keyboard traps;
- pointer and touch input, adequate targets, and alternatives to dragging or complex gestures;
- zoom, text resizing, reflow, language expansion, and orientation where relevant;
- loading, empty, error, success, disabled, destructive, interrupted, and recovery states;
- reduced motion, high contrast, and user theme preferences where supported;
- input preservation across validation errors, network failures, accidental dismissal, navigation, and retries;
- semantic HTML first, with ARIA only where native elements cannot express the required behavior;
- contrast and non-color cues for text, controls, focus, status, charts, and essential graphics;
- performance sufficient to preserve comprehension and input feedback.

Use WCAG 2.2 as the baseline: [WCAG overview](https://www.w3.org/WAI/standards-guidelines/wcag/) and [what changed in WCAG 2.2](https://www.w3.org/WAI/standards-guidelines/wcag/new-in-22/).

Accessibility is a boundary, not a reason to import a platform appearance. Native behavior and recoverability matter; a universal card, grid, palette, type scale, or modal structure does not follow from WCAG.

## Round 2 graphic production checks

Do not make rendered verification a gate for selecting or locking graphic design. When the human asks for a production-ready graphic export, check the applicable delivery facts:

- final dimensions, resolution, orientation, crop, safe area, and bleed;
- hierarchy at intended viewing distance and realistic display conditions;
- critical text legibility and contrast;
- typographic shaping, glyph coverage, line breaks, overset text, and embedded or outlined font status;
- color space, ink or material limits, overprint, transparency, and export settings where relevant;
- delivery as verified PNG, WebP, JPEG, or PDF rather than generated SVG;
- image rights, effective resolution, compression, and generated-image disclosure where applicable;
- production tolerances, folds, binding, cutting, substrate, fabrication, or environmental placement;
- alternate crops and channel formats without losing the locked direction;
- a physical proof or representative device proof when the risk warrants it.

Graphic work does not require interface tests or a mandatory screenshot proof. State which production facts were checked and which remain with the human, printer, fabricator, or other specialist.

## Composition integrity

For every proof artifact, inspect whether:

- the subject remains identifiable after content changes;
- the signature traits survive adaptation without becoming decoration;
- functional additions have not pulled the work toward a generic platform system;
- accessibility fixes preserve the premise while solving the real barrier;
- typography, imagery, icons, and motion remain subordinate to one constitution;
- the work is still recognizable without its most conspicuous effect;
- the artifact feels authored rather than assembled from available parts.

When an artifact fails, identify whether the constitution is weak or the implementation violated it. Reopen the committed direction only with human approval unless the failure creates cultural harm, inaccessible operation, data loss, or another safety boundary.

## Completion record

State:

- for Round 1, which HTML files were created and opened; for Round 2, what was rendered and where;
- which real content and conditions were tested;
- what passed;
- what failed or remains untested;
- which proof level has been reached;
- the next human decision or production action.

Do not call work complete because files exist, code compiles, or one ideal screenshot looks good.
