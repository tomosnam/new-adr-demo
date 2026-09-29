---
name: new-adr
description: Create a new Architecture Decision Record (ADR) in docs/adr/ using the team's MADR template, frontmatter contract and DM-0001 source labels. Use when the user asks to create, draft or document an architecture decision.
disable-model-invocation: true
argument-hint: [decision title]
allowed-tools: Bash(bash ${CLAUDE_SKILL_DIR}/scripts/next-adr-id.sh *)
---

# Create a new ADR

Decision title: **$ARGUMENTS**

If the title is empty, ask the user for it and stop.

## Steps

1. **Get the next ID.** Run:
   `bash ${CLAUDE_SKILL_DIR}/scripts/next-adr-id.sh docs/adr`
   It prints the next free ID (for example `DM-0003`). Use it exactly.

2. **Ask before writing.** In one message, ask the user for anything you cannot find in the repo:
   - the context / problem
   - the options they considered (at least 2)
   - the chosen option and why
   - decision-makers and consulted people
   Do not invent names, dates or business facts.

3. **Fill the template.** Copy [madr-template.md](madr-template.md) and fill every section.
   Match the tone, depth and structure of [example-DM-0001.md](example-DM-0001.md).

4. **Label every data point.** Apply the rules in [source-labels.md](source-labels.md):
   - anything you wrote without a verifiable source is `AI_INFERENCE`
   - the document-level `source` must be the lowest-confidence label used anywhere inside it

5. **Save** as `docs/adr/<ID>-<kebab-case-title>.md` with `status: Draft`.
   The frontmatter `status` and the `## Status` section must match.

6. **Report** the file path and list every `AI_INFERENCE` item the user must validate before the ADR can be `Published`.

## Never

- Set `status: Published`. Only a human reviewer does that.
- Mark content as `BUSINESS_EXPERT` unless the user confirmed it in this conversation; then add today's date: `BUSINESS_EXPERT (YYYY-MM-DD)`.
