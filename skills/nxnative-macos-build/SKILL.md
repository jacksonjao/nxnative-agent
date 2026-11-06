---
name: nxnative-macos-build
description: Build the nxnative macOS host from a local checkout using the upstream documented build process, without game files or credentials.
---

# Build nxnative on macOS

Read the local checkout's `AGENTS.md` and `docs/development.md` first. This skill covers a source build only; packaging or running a title requires separate user direction and local lawful files.

Use `sh scripts/build-macos.sh <checkout> <title-id>` to invoke upstream's `make -C dm/host GAME=<title-id> dmhost` after checking the checkout and title ID. The helper does not fetch dependencies, modify profiles, run a game, or copy outputs. Review the helper's printed command and build output. A compile is not a compatibility test.

The GitHub Actions workflow is a manual convenience that checks out upstream source and attempts a host build on macOS. It has read-only repository permissions, accepts a title ID, does not use secrets, does not upload artifacts, and must not be used to build or process game files.
