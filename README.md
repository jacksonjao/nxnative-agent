# NXNative Agent

Codex project guidance and safe tooling for research and development against a **local checkout** of [`seedds/nxnative`](https://github.com/seedds/nxnative).

This repository does not contain the emulator, game data, or a replacement for upstream's agent handbook. It provides a small coordination layer: Codex instructions, repeatable research notes, safe local helper scripts, and an optional macOS build workflow. The upstream project remains the source of truth for implementation details.

## Start here

1. Clone this repository and the upstream project separately.
2. Open the nxnative checkout in Codex, or tell Codex its local path.
3. Ask Codex to read this repository's `AGENTS.md` and the upstream `AGENTS.md` plus `docs/agents/README.md`.
4. Start with `skills/nxnative-research/SKILL.md` for a title investigation or `skills/nxnative-port/SKILL.md` for implementation work.

Example:

```text
Use the nxnative-research skill. My nxnative checkout is ~/src/nxnative.
Research the compatibility of the title I own. Do not access or copy game files;
I will run upstream extraction tools locally if needed and share sanitized findings.
```

## What is included

- `AGENTS.md`: Codex operating rules and the boundary between this project and upstream.
- `skills/`: focused research, porting, macOS build, and diagnostics workflows.
- `scripts/`: path-checked helpers for upstream documentation discovery, macOS host builds, and sanitized diagnostic summaries.
- `templates/experiment.md`: a reproducible experiment record.
- `.github/workflows/macos-build.yml`: opt-in, manual macOS host build; no game files or secrets are supplied.

## Safety and scope

Use only software and game data you are legally entitled to use. Keep NSP/XCI files, ROMs, prod.keys, firmware, extracted files, save data, copyrighted assets, crash dumps, and credentials outside both repositories and out of commits, issues, workflow artifacts, and prompts. Do not print key values. Do not download or redistribute game content. Scripts here never acquire game data or keys.

The macOS workflow builds upstream's host from source and uploads no artifacts. A successful compile says nothing about compatibility with any game. Runtime validation must be performed by the owner with lawfully obtained files on their own machine; report only sanitized logs and findings.

## Upstream documentation

Read the current upstream [`AGENTS.md`](https://github.com/seedds/nxnative/blob/main/AGENTS.md) and [agent guide index](https://github.com/seedds/nxnative/blob/main/docs/agents/README.md) before acting. Those documents already explain extraction, static survey, bring-up, graphics, debugging, and the developer loop in depth. This project adds Codex task framing, safety boundaries, experiment records, and opt-in helpers; it intentionally does not mirror the upstream technical recipes.

## License

MIT. See [LICENSE](LICENSE). This license applies to this repository's original files only; upstream nxnative remains under its own license.
