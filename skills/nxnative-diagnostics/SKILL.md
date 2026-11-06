---
name: nxnative-diagnostics
description: Collect and interpret minimal, sanitized nxnative diagnostic evidence while keeping game data, keys, and private dumps local.
---

# NXNative diagnostics

Read upstream `docs/agents/03-bringup.md` and `05-debugging.md`, plus the symptom index. Ask for a short relevant excerpt rather than whole logs or crash dumps. Never ask for game files, keys, firmware, saves, or screenshots of copyrighted content.

Use `python3 scripts/summarize-diagnostics.py <log>` for a local marker summary. It reads only the specified text log, prints counts and redacted matching lines for common markers, and writes nothing. Inspect the summary manually for private details before sharing. Do not assume its redaction catches every secret.

Record the exact upstream revision, build, platform, run duration, reproduction steps, observed markers, and whether the result is a compile, boot, first-frame, sustained-play, or device observation. Keep raw logs and dumps on the owner's machine.
