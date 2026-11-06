# NXNative Agent instructions

These instructions govern work requested through this repository. The target is a separately checked-out [`seedds/nxnative`](https://github.com/seedds/nxnative); this repository is guidance and tooling, not the emulator source.

## Before each task

1. Locate the user's local nxnative checkout. Never assume a path or modify another checkout without identifying it.
2. Read its current `AGENTS.md` and the relevant guide under `docs/agents/`. They are authoritative for upstream conventions and may change after this project was written.
3. Identify the requested outcome and the smallest relevant subsystem. Prefer a read-only survey before edits.
4. Keep work and artifacts in the upstream project's intended external game work folder when applicable. Never put user game files inside either repository.

## Research and implementation rules

- Base conclusions on observable evidence: module/build metadata, import and SVC censuses, logs, measurements, and reproducible steps. Label unknowns as unknown; do not infer compatibility from engine names alone.
- Preserve upstream's model: one profile per title; title/build-specific behavior must be explicitly gated; prefer general fixes; trace failures to root causes. Do not add speculative stubs, sleeps, retries, clamps, or feature-disable switches as fixes.
- Separate static assessment, compile success, boot, first frame, sustained play, and device validation. Never claim a stage that was not observed.
- Before editing upstream, present a concise plan and inspect the relevant code and references. Make narrowly scoped changes and document evidence in the location upstream specifies.
- Do not commit, push, publish, sign, install, or sideload unless the user explicitly asks for that action in the current task.
- Do not run extraction, game, shader, or device workflows unless the user has provided a lawful local setup and specifically requested the work. Never ask them to paste keys or copyrighted files.

## Sensitive material

Never read, print, upload, stage, commit, or transmit ROMs/NSP/XCI, prod.keys, firmware, extracted game assets, save data, copyrighted screenshots/audio, private crash dumps, or credentials. Do not place any of these in prompts, issues, logs, CI artifacts, or this repository. If they appear in a proposed diff, stop and remove them before proceeding.

For diagnostics, request only the relevant sanitized excerpt. `scripts/summarize-diagnostics.py` produces counts of common markers and redacts likely home-directory paths and token-like strings; review its output before sharing because automatic redaction cannot guarantee removal of every secret.

## Repository hygiene

- Keep documentation in English and link to upstream pages instead of copying them.
- Keep helper scripts read-only unless their stated purpose is a local build. Validate paths and arguments; never delete, overwrite, or install files implicitly.
- Keep experiments in `experiments/` or start from `templates/experiment.md`. Record the exact upstream revision, environment, hypothesis, action, evidence, outcome, and next step.
- Do not add copyrighted game-derived material or credentials to examples and fixtures.
