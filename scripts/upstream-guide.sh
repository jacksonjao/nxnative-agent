#!/bin/sh
set -eu

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 <nxnative-checkout> [guide]" >&2
  echo "Guides: AGENTS.md, docs/agents/README.md, 01-extract.md, 02-survey.md, 03-bringup.md, 04-graphics.md, 05-debugging.md, 06-dev-loop.md, symptoms.md" >&2
  exit 2
fi

root=$(cd "$1" 2>/dev/null && pwd -P) || { echo "Checkout path not found" >&2; exit 2; }
guide=${2:-docs/agents/README.md}
case "$guide" in
  AGENTS.md|docs/agents/README.md|docs/agents/01-extract.md|docs/agents/02-survey.md|docs/agents/03-bringup.md|docs/agents/04-graphics.md|docs/agents/05-debugging.md|docs/agents/06-dev-loop.md|docs/agents/symptoms.md) ;;
  *) echo "Guide is not in the allowlist" >&2; exit 2 ;;
esac
file="$root/$guide"
[ -f "$file" ] || { echo "Guide not found: $guide" >&2; exit 1; }
printf 'Upstream checkout: %s\nGuide: %s\n' "$root" "$guide"
if command -v git >/dev/null 2>&1 && git -C "$root" rev-parse --short HEAD >/dev/null 2>&1; then
  printf 'Revision: %s\n' "$(git -C "$root" rev-parse --short HEAD)"
fi
printf '\nOpen this file in your editor: %s\n' "$file"
