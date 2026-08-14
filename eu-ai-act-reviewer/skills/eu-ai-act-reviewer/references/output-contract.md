# Review output contract

Write the report in plain English. Do not use a compliance score, traffic-light grade, pass/fail result, or final legal classification.

## The statement that always appears

Every response this skill produces states that it is educational EU AI Act issue-spotting, not legal advice, and not proof that any duty is or is not met.

This holds without exception: the full report, a turn that only asks clarifying questions, a partial or interrupted answer, a single-finding follow-up, a correction, a refusal, and every later message in the same conversation. Length is never a reason to drop it — a one-line reply about one article still carries it. No one may receive output from this skill that could be mistaken for a lawyer's answer.

## Report header

Start with:

- **Review scope:** the journey, content, files, environment, and time period reviewed.
- **Evidence level:** the strongest evidence available, using `review-rules.md`.
- **Legal currency:** live sources checked with date and language, or the exact fallback warning from `official-sources.md`. If any verification step failed, was blocked, or was skipped, name it here and say which findings rest on unverified sources. Never leave a reader to assume verification happened.
- **Known limits:** what was not supplied, not run, not deployed, or not observed.

## Required ten fields for every finding

Use a stable identifier such as `EUAI-001`. Include all ten fields in this order:

1. **Review surface:** the journey stage, exact content passage, or file and line.
2. **Observed evidence:** what the supplied material actually proves, without legal conclusions.
3. **Possible AI Act trigger:** the narrow provision or issue that the evidence may engage.
4. **Role and conditions:** the role and every material condition that determines whether the provision applies.
5. **Official source level and exact link:** label it `Law`, `Official guidance`, or `Voluntary code`; name the article or document and link directly to the official source.
6. **Applicable date:** the date for that provision and any transition that could change it.
7. **Status:** use exactly one allowed value from the status table below.
8. **Missing facts:** facts needed to confirm, narrow, or dismiss the trigger. Write `None identified from this review` only when justified.
9. **Next action:** one bounded evidence-gathering, design, content, engineering, or legal-review action.
10. **Human decision required:** the named decision a responsible person must make; never assign it to the agent.

## Allowed status values

| Status | Use only when |
|---|---|
| `likely relevant` | Supplied evidence supports the main legal conditions, but the finding remains issue-spotting rather than a legal verdict. |
| `possibly relevant` | There is concrete evidence for a plausible trigger, but one or more material conditions remain uncertain. |
| `insufficient evidence` | A blocking fact prevents a responsible trigger analysis. |
| `no trigger found in the supplied evidence` | The reviewed evidence does not show the conditions for the named trigger. This is not proof that no duty or other law applies. |

Do not invent synonyms such as “compliant,” “non-compliant,” “high risk,” “low risk,” “pass,” “fail,” “safe,” or “approved.”

## Finding template

```markdown
### EUAI-001 — [plain-language issue]

1. **Review surface:** ...
2. **Observed evidence:** ...
3. **Possible AI Act trigger:** ...
4. **Role and conditions:** ...
5. **Official source level and exact link:** Law — [Article ...](official URL)
6. **Applicable date:** ...
7. **Status:** possibly relevant
8. **Missing facts:** ...
9. **Next action:** ...
10. **Human decision required:** ...
```

## Evidence and citation rules

- Use a file and line for code, a named stage for a journey, and a short exact passage or timestamp for public content.
- Keep quotations short and preserve supplied wording exactly.
- Cite the operative law for every legal trigger. Add guidance only when it explains implementation and label it accurately.
- If a finding relies on more than one source level, list each separately rather than blending them.
- If the application date depends on missing facts, say so in fields 6 and 8.
- If live legal verification failed, no finding may claim that its legal statement is current.

## Closing section

End with:

1. **Human decisions now required:** a deduplicated list drawn from field 10.
2. **Evidence still needed:** the shortest list that would materially change findings.
3. **Separate legal signposts:** other regimes named without assessment.
4. **Limitations:** educational issue-spotting, not legal advice or proof of compliance.

If there are no positive findings, do not say “nothing applies.” State which surfaces were checked, use `no trigger found in the supplied evidence` where a named trigger was tested, and repeat the evidence limits.
