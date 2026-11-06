#!/bin/sh
set -eu

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <nxnative-checkout> <title-id-hex>" >&2
  exit 2
fi
root=$(cd "$1" 2>/dev/null && pwd -P) || { echo "Checkout path not found" >&2; exit 2; }
game=$2
case "$game" in
  ''|*[!0-9A-Fa-f]*) echo "Title ID must contain hexadecimal characters only" >&2; exit 2 ;;
esac
[ ${#game} -eq 16 ] || { echo "Title ID must be exactly 16 hexadecimal characters" >&2; exit 2; }
[ -d "$root/.git" ] || [ -f "$root/.git" ] || { echo "Path is not a git checkout" >&2; exit 2; }
[ -f "$root/dm/host/Makefile" ] || { echo "Expected upstream host Makefile was not found" >&2; exit 2; }
if [ "$(uname -s)" != Darwin ]; then
  echo "This helper builds only on macOS (Darwin)." >&2
  exit 2
fi
printf 'Building upstream nxnative host for profile %s in %s\n' "$game" "$root"
printf 'Command: make -C dm/host GAME=%s dmhost\n' "$game"
cd "$root"
exec make -C dm/host "GAME=$game" dmhost
