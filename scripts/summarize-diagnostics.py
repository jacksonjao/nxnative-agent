#!/usr/bin/env python3
"""Print a small, best-effort redacted summary of an nxnative text log."""
from __future__ import annotations

import re
import sys
from collections import Counter
from pathlib import Path

MARKERS = ("[RED]", "UNIMPL", "CRASH sig=", "memory up to frame", "[longframe]", ">>> nnMain")
HOME = re.compile(r"(?<!\w)/(?:Users|home)/[^\s:'\"]+")
TOKEN = re.compile(r"(?i)\b(?:gh[pousr]_[A-Za-z0-9_]{16,}|github_pat_[A-Za-z0-9_]{20,}|Bearer\s+[A-Za-z0-9._-]{16,})\b")
HEX_KEY = re.compile(r"(?i)\b[0-9a-f]{64,}\b")


def redact(line: str) -> str:
    line = HOME.sub("<HOME_PATH>", line)
    line = TOKEN.sub("<REDACTED_TOKEN>", line)
    return HEX_KEY.sub("<REDACTED_LONG_HEX>", line)


def main() -> int:
    if len(sys.argv) != 2:
        print(f"Usage: {Path(sys.argv[0]).name} <text-log>", file=sys.stderr)
        return 2
    path = Path(sys.argv[1]).expanduser()
    if not path.is_file():
        print("Log file not found", file=sys.stderr)
        return 2
    counts: Counter[str] = Counter()
    samples: dict[str, list[str]] = {marker: [] for marker in MARKERS}
    try:
        with path.open("r", encoding="utf-8", errors="replace") as stream:
            for line in stream:
                for marker in MARKERS:
                    if marker in line:
                        counts[marker] += 1
                        if len(samples[marker]) < 3:
                            samples[marker].append(redact(line.rstrip())[:500])
    except OSError as exc:
        print(f"Could not read log: {exc}", file=sys.stderr)
        return 1
    print("Sanitized marker summary (review every line before sharing):")
    for marker in MARKERS:
        print(f"\n{marker}: {counts[marker]}")
        for sample in samples[marker]:
            print(f"  {sample}")
    print("\nRedaction is best-effort; this output may still contain private information.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
