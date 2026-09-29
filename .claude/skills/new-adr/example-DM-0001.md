---
id: DM-0001
title: "Source Confidence Classification Model for Documentation"
description: "Defines a controlled vocabulary of six values for classifying the origin and confidence level of each data point in documentation, and establishes a mandatory human validation gate for AI-generated content before publication."
type: standard
domain: conventions
status: Draft
date: 2026-08-19
decision-makers:
  - Example Decision Maker
consulted:
  - Example Consultant (Co-Lead Enablement & SDLC)
informed:
  - SDLC stream
  - PM stream
supersedes: null
superseded-by: null
tags:
  - source-confidence
  - data-provenance
created: 2026-08-19
last_modified: 2026-09-09
source: "BUSINESS_EXPERT (2026-08-26)"
---

# DM-0001 — Source Confidence Classification Model for Documentation

## Status

Draft

## Context and Problem Statement

The AI-first initiative generates technical documentation that is partially produced by AI tools. Without an explicit mechanism to distinguish verifiable facts from objective sources (DDL metadata, application code, queries against the instance) from AI-generated semantic inferences, any consumer (AI agent, developer, analyst) would treat all content with the same level of confidence.

How should the origin of each documented data point be classified so that its reliability is determinable without external context?

## Decision Drivers

- Content marked `AI_INFERENCE` requires human validation before production use; without classification, this gate cannot be enforced
- Content derived from objective sources is independently verifiable and does not need the same review level
- Automated consumers (AI agents, pipelines) need provenance metadata to calibrate the reliability of a response
- Review process scalability: a controlled vocabulary lets us automate which content needs human validation

## Considered Options

1. **No classification** — all content is treated with the same confidence
2. **Binary AI / non-AI** — only distinguish whether a data point was AI-generated
3. **Free-text source per author** — each author describes the source in their own words
4. **Adopt an existing provenance standard directly** — e.g. W3C PROV-O
5. **Controlled vocabulary of 6 values** — chosen

## Decision Outcome

Chosen option: **Controlled vocabulary of 6 values**, because each value unambiguously identifies the type of source behind a data point, allowing any consumer to determine its reliability without external context, while staying simple enough for non-specialists to adopt.

### Positive Consequences

- Every documented data point has a traceable origin and an implicit confidence level
- The human validation gate for `AI_INFERENCE` is enforceable from the first published file

### Negative Consequences

- Requires authoring discipline on every file; classification cannot be fully automated
- Does not capture derivation chains between sources (unlike PROV-O)

### Neutral Consequences

- The vocabulary can be extended later through a superseding ADR without invalidating existing files

## Pros and Cons of the Options

### Option 1 — No classification

- **Good**, because it requires zero authoring overhead
- **Bad**, because consumers must assume all content is equally reliable, which is false for AI-generated content

### Option 2 — Binary AI / non-AI

- **Good**, because it is simpler than six values
- **Bad**, because it treats DDL-derived facts and business-expert knowledge as equally trustworthy

### Option 4 — Adopt PROV-O directly

- **Good**, because it aligns with an international standard
- **Bad**, because its ontological model requires specialist knowledge the team does not have

### Option 5 — Controlled vocabulary of 6 values (chosen)

- **Good**, because it is self-explanatory and adoptable without training
- **Bad**, because it lacks derivation-chain expressiveness

## Validation

- Every `Published` document declares a `Source` value in each data section
- No `AI_INFERENCE` data point is used in decisions without recorded human approval

## Links

- [W3C PROV-O](https://www.w3.org/TR/prov-o/) — conceptual foundation of this model

## Changelog

- 2026-08-19 — Created
- 2026-09-09 — Updated: added Combination and Consistency rules
