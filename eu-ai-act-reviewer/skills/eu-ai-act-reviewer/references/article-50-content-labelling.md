# Article 50: interaction, marking, and disclosure

## Legal basis and date

Article 50 of [Regulation (EU) 2024/1689](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32024R1689) applies from **2 August 2026**. Read it together with Article 2 scope, Article 3 definitions, Article 111 transitions, Article 113 application rules, and [Regulation (EU) 2026/1744](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32026R1744).

For providers of systems placed on the market before 2 August 2026, amended Article 111(4) gives until **2 December 2026** to comply with Article 50(2). Verify the placement date before using that transition.

## First split: role and audience

Do not ask “Was AI used?” and jump to one label. Determine the actor and duty first.

| Situation | Actor | Main duty to test |
|---|---|---|
| AI system interacts directly with a person | Provider | Article 50(1): design the interaction so the person is informed, unless it is obvious in context; check the law-enforcement exception. |
| AI system generates synthetic text, image, audio, or video | Provider | Article 50(2): make the output machine-readable and detectable as artificial, subject to technical feasibility and stated exceptions. |
| Emotion recognition or biometric categorisation is used on people | Deployer | Article 50(3): inform exposed people of the system's operation, subject to the stated law-enforcement exception. |
| Generated or manipulated image, audio, or video is a deepfake | Professional deployer | Article 50(4): disclose artificial generation or manipulation, subject to the stated exceptions and treatment for artistic or analogous work. |
| Generated or manipulated text informs the public on a matter of public interest | Professional deployer | Article 50(4): disclose artificial generation or manipulation unless a stated exception applies. |

Article 2(10) excludes deployer obligations for a natural person using AI in a purely personal, non-professional activity. Regular business, employment, freelance, organisational, or public-authority use may be professional. This exclusion does not erase a separate provider's duties.

## Provider duties

### Direct interaction — Article 50(1)

Test whether the system is intended to interact directly with natural persons. The provider must design and develop it so people are informed that they are interacting with AI unless that is obvious to a reasonably well-informed, observant, and circumspect person in the circumstances and context.

Do not treat a product name containing “AI” as automatic proof that the interaction is obvious. Review the actual first interaction, audience, context, and vulnerable users.

### Machine-readable marking — Article 50(2)

The provider duty covers synthetic **audio, image, video, and text** output. It is not limited to deepfakes and is different from a visible or audible disclosure to a person.

Test the exceptions in the law:

- the system only assists standard editing; or
- the system does not substantially alter the deployer's input data or its meaning; or
- an applicable law authorises the use to detect, prevent, investigate, or prosecute criminal offences.

Do not prescribe one metadata technology as legally mandatory unless a current binding standard or implementing rule says so. Evidence of a technical mark must show that it is present in the actual exported output and detectable; a function name, configuration flag, or UI label is not enough.

## Deployer duties

### Emotion recognition and biometric categorisation — Article 50(3)

Review whether people exposed to the system are informed of its operation. This is a human-facing information duty and is separate from Article 50(2) content marking. Signpost data-protection law as a separate review without assessing it.

### Image, audio, and video deepfakes — Article 50(4)

Use the Article 3(60) definition. A deepfake is AI-generated or manipulated image, audio, or video content that:

1. resembles existing or plausible persons, objects, places, entities, or events; and
2. would falsely appear to a person to be authentic or truthful.

Both elements need evidence. AI assistance alone does not establish a deepfake.

For evidently artistic, creative, satirical, fictional, or analogous work or programmes, the law limits the duty to an appropriate disclosure of the generated or manipulated content that does not hamper display or enjoyment. Do not turn that treatment into a blanket exemption.

### Public-interest text — Article 50(4)

Test all of these questions:

1. Was the text generated or manipulated by an AI system?
2. Is it published to inform the public?
3. Does it concern a matter of public interest?
4. Did it undergo human review or editorial control?
5. Does a natural or legal person hold editorial responsibility for publication?

The disclosure duty does not apply when the law-enforcement exception applies or when both human review or editorial control and editorial responsibility are present. Commission guidance says review must be meaningful; a spelling check alone is not enough. Label that statement as `Official guidance`, not as extra statutory wording.

## How information must be presented — Article 50(5)

Information required by Article 50(1) to (4) must be:

- clear and distinguishable;
- provided no later than the first interaction or exposure; and
- compliant with applicable accessibility requirements.

The regulation does not prescribe one universal sentence, icon, colour, or placement for every case. Review whether the chosen implementation meets the legal qualities in its real context.

## Law, guidance, and voluntary tools

- **Law:** Article 50 creates the duties.
- **Official guidance:** the [Commission guidelines](https://digital-strategy.ec.europa.eu/en/library/guidelines-transparency-obligations-providers-and-deployers-ai-systems) and [Article 50 questions and answers](https://digital-strategy.ec.europa.eu/en/faqs/transparency-obligations-under-article-50-ai-act) explain the Commission's implementation view.
- **Official optional tool:** the [EU labelling icons](https://digital-strategy.ec.europa.eu/en/policies/eu-icons-labelling-ai-generated-content) may support communication. They are optional, should be accompanied by understandable text where needed, and do not prove compliance by themselves.
- **Voluntary code:** the [Code of Practice](https://digital-strategy.ec.europa.eu/en/policies/code-practice-ai-generated-content) supports implementation. It does not replace the legal test.

When the user requests the legal minimum, do not add a broader “label everything” policy. Return the narrow supported finding and identify missing facts.

## Always link the current official icons

When a finding reports a human-facing disclosure duty under Article 50(1), (3), (4), or (5), link the official EU icons page in that finding. Never describe the icon set from memory. That page is revised, and the icons, file formats, and variants it offers change; linking it lets the reader see the set that exists today.

State the Commission's own position alongside the link:

> The use of these EU icons is optional, but the labelling requirements under Article 50 AI Act are not. The use of these icons does not establish legal compliance by itself. Deployers remain responsible for ensuring that any disclosure meets the requirements of Article 50 AI Act. Signatories of the Code of Practice on marking and labelling of AI-generated content must duly implement the measures it contains.

Design note, offered as a suggestion only. Because the regulation prescribes no specific icon, an organisation may design its own mark so the disclosure fits its brand rather than sitting on the page as a foreign asset. A custom mark carries the same burden as the official one: it must be clear and distinguishable, present no later than first exposure, accessible, and accompanied by understandable words where an icon alone would not convey artificial generation. Choosing the official icon, a custom mark, or plain words changes none of the underlying duties.

Put this suggestion in the finding's next action or in a closing note. Never place it in the official source level field, and never label it `Law`, `Official guidance`, or `Voluntary code` — it is a design opinion, not a source of authority.

## Common review errors

- Mixing the provider's machine-readable mark with the deployer's human-facing disclosure.
- Calling every AI-generated image, audio file, or video a deepfake.
- Treating all AI-assisted text as public-interest text.
- Ignoring personal versus professional use.
- Assuming any human touch removes the text duty.
- Treating an EU icon, watermark, metadata flag, or platform label as proof of compliance.
- Checking only the intended path and missing the first exposure after sharing, download, embed, or failure.
