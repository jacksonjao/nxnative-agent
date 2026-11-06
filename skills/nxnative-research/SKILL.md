---
name: nxnative-research
description: Research compatibility or diagnose a title against a local seedds/nxnative checkout using evidence-first, safe procedures. Use when asked to survey a title, interpret compatibility evidence, or plan bring-up.
---

# NXNative title research

## Read upstream first

Locate the checkout and read its `AGENTS.md`, `docs/agents/README.md`, and the relevant current guides: `01-extract.md`, `02-survey.md`, `03-bringup.md`, `symptoms.md`, and `06-dev-loop.md`. Do not copy their procedures into this repository; link to them in notes.

## Safe research sequence

1. Clarify the requested assessment stage: public metadata only, user-provided sanitized survey, or local runtime evidence. Never request or inspect the title's ROM/NSP/XCI, keys, firmware, or extracted assets.
2. Record upstream revision and publicly observable title metadata only when the user provides it or asks for public research. Treat title identity and SDK/engine markers as clues, not compatibility results.
3. Build an evidence table with claim, observation/source, confidence, and unresolved question. Separate known upstream support from analogy to other titles.
4. Map likely unknowns to upstream's own guide and symptom index. Identify what the owner can measure locally without transferring protected data.
5. Give a staged verdict: static feasibility, compile, boot, first frame, sustained play, and device validation. Mark unobserved stages “not tested.”
6. If implementation is requested, switch to `nxnative-port` and follow its edit gates.

## Deliverable

Summarize evidence, confidence, risks, next safe local observations, and a clear “not tested” list. Do not invent a compatibility percentage. Do not declare a title playable based on a build or a successful boot alone.
