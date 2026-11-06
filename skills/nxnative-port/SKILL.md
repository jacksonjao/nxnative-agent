---
name: nxnative-port
description: Plan or implement a narrowly scoped compatibility fix in a local seedds/nxnative checkout, following upstream architecture and evidence requirements.
---

# NXNative porting and analysis

## Preparation

Read the checkout's `AGENTS.md`, `docs/agents/README.md`, and task-specific bring-up, graphics, debugging, game-patches, and developer-loop pages. Search the symptom index and subsystem references before proposing a new mechanism. Confirm the checkout and working tree before editing.

## Work method

1. Reproduce or inspect the concrete failure from sanitized evidence.
2. Trace the bad value or behavior to its source and identify the host/kernel/SDK semantics involved.
3. Check whether a general fix applies. Add per-title data or build-gated behavior only when the evidence requires it.
4. Keep each change small. Add a code comment with the observation that justifies non-obvious behavior. Put game-specific findings in that title's upstream note; put general mechanisms in the subsystem reference and symptom index.
5. Follow upstream's own verification matrix for the touched code. The user requested no tests unless they explicitly ask; otherwise report the exact checks that are appropriate without running them.
6. Report what changed, evidence, checks run or not run, and remaining open questions. Do not commit or push unless asked.

## Boundaries

Do not process or copy protected game content. Do not sign/install apps or use user devices. Do not treat a workaround as a root-cause fix. Never claim iOS or sustained-play validation without direct evidence.
