#!/usr/bin/env bash
# Install the dtp theme and switch to it. Safe to run again: it updates the
# installed copy and applies it again.
#
#   ./install.sh

set -euo pipefail

fail() {
  echo "install: $*" >&2
  exit 1
}

[[ ${1:-} != "-h" && ${1:-} != "--help" ]] || { echo "Usage: install.sh"; exit 0; }
[[ $# -eq 0 ]] || fail "unknown argument: $1"
command -v omarchy >/dev/null || fail "omarchy is required"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.config/omarchy/themes/dtp"
URL="$(git -C "$ROOT" remote get-url origin 2>/dev/null || true)"

if [[ -n $URL && $URL == https://* ]]; then
  # A git copy, so `omarchy theme update` can bring in later changes.
  omarchy theme install "$URL"
else
  mkdir -p "$DEST"
  rsync -a --delete --exclude .git "$ROOT/" "$DEST/"
fi
[[ -f $DEST/colors.toml ]] || fail "the theme did not install to $DEST"

omarchy theme set dtp
echo "Theme dtp is on"
