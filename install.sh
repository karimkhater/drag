#!/bin/bash
# DRAG installer: downloads the latest release and installs it into Applications.
#   curl -fsSL https://raw.githubusercontent.com/karimkhater/drag/main/install.sh | bash
# Run it again any time to reinstall or repair.
set -euo pipefail
REPO="karimkhater/drag"
# hw.optional.arm64 is 1 on Apple Silicon even when this shell runs under Rosetta.
if [ "$(sysctl -in hw.optional.arm64 2>/dev/null)" = "1" ]; then FILE="DRAG-Apple-Silicon.dmg"; else FILE="DRAG-Intel.dmg"; fi
FILE="${DRAG_FILE:-$FILE}"     # overrides used by the release checks
DEST="${DRAG_DEST:-/Applications}"
[ -w "$DEST" ] || { DEST="$HOME/Applications"; mkdir -p "$DEST"; }
TMP="$(mktemp -d)"; MNT="$TMP/mnt"
cleanup() { hdiutil detach -quiet "$MNT" 2>/dev/null || true; rm -rf "$TMP"; }
trap cleanup EXIT

echo "Downloading DRAG ($FILE)..."
curl -fL --progress-bar -o "$TMP/$FILE" "https://github.com/$REPO/releases/latest/download/$FILE"
mkdir "$MNT"
hdiutil attach -quiet -nobrowse -readonly -mountpoint "$MNT" "$TMP/$FILE"
if pgrep -x DRAG >/dev/null; then osascript -e 'tell application "DRAG" to quit' >/dev/null 2>&1 || true; sleep 2; fi
rm -rf "$DEST/DRAG.app"
ditto "$MNT/DRAG.app" "$DEST/DRAG.app"
xattr -dr com.apple.quarantine "$DEST/DRAG.app" 2>/dev/null || true
if ! codesign --verify --deep --strict "$DEST/DRAG.app" 2>/dev/null; then
  echo "The downloaded app failed its integrity check. Please try again or tell Karim."; exit 1
fi
echo "DRAG installed in $DEST. Opening it now."
[ -n "${DRAG_NO_OPEN:-}" ] || open "$DEST/DRAG.app"
