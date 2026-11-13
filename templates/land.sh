#!/usr/bin/env bash
# land.sh: land approved changes, one manifest at a time, with backups and an undo script.
#
# Run: land.sh MANIFEST
# MANIFEST lines (tab-separated):  <live file>  <new version>  <approved sha256 of live file>
# Use "-" as the sha256 for a live file that does not exist yet.
#
# For each line it: refuses if the live file changed since approval; copies the live
# file to <live>.bak-<stamp>; copies the new version in. It writes restore-<stamp>.sh
# next to the manifest. Nothing is deleted.
set -euo pipefail

manifest="${1:?run as: land.sh MANIFEST}"
stamp="$(date +%Y%m%d-%H%M%S)"
restore="$(dirname "$manifest")/restore-$stamp.sh"
sha() { if command -v sha256sum >/dev/null; then sha256sum "$1" | cut -d' ' -f1; else shasum -a 256 "$1" | cut -d' ' -f1; fi; }

# Pass 1: check every fingerprint before touching anything.
while IFS=$'\t' read -r live new approved; do
  [[ -z "${live:-}" || "$live" == \#* ]] && continue
  [[ -f "$new" ]] || { echo "REFUSED: new version missing: $new" >&2; exit 1; }
  if [[ "$approved" == "-" ]]; then
    [[ ! -e "$live" ]] || { echo "REFUSED: $live exists but was approved as new" >&2; exit 1; }
  else
    [[ "$(sha "$live")" == "$approved" ]] || { echo "REFUSED: $live changed since approval" >&2; exit 1; }
  fi
done < "$manifest"

# Pass 2: back up, land, and record the undo.
printf '#!/usr/bin/env bash\nset -euo pipefail\n' > "$restore"
while IFS=$'\t' read -r live new approved; do
  [[ -z "${live:-}" || "$live" == \#* ]] && continue
  if [[ "$approved" == "-" ]]; then
    printf 'mv %q %q\n' "$live" "$live.landed-$stamp" >> "$restore"
  else
    cp -p "$live" "$live.bak-$stamp"
    printf 'cp -p %q %q\n' "$live.bak-$stamp" "$live" >> "$restore"
  fi
  mkdir -p "$(dirname "$live")"
  cp "$new" "$live"
  echo "LANDED: $live  (before $approved, after $(sha "$live"))"
done < "$manifest"
chmod +x "$restore"
echo "UNDO: $restore"
