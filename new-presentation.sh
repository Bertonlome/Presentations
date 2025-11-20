#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <folder-name> [Title Case Name]"
  exit 1
fi

FOLDER="$1"
TITLE="${2:-$1}"
ROOT="$(cd "$(dirname "$0")" && pwd)"

# Choose a template source:
if [[ -d "$ROOT/template" ]]; then
  SRC="$ROOT/template"
else
  # fallback: use Spellburst as a skeleton
  SRC="$ROOT/Spellburst"
fi

if [[ ! -d "$SRC" ]]; then
  echo "Template source not found. Create '$ROOT/template' or keep '$ROOT/Spellburst' as a skeleton."
  exit 1
fi

DEST="$ROOT/$FOLDER"
if [[ -e "$DEST" ]]; then
  echo "Destination '$DEST' already exists."
  exit 1
fi

# Copy template
cp -R "$SRC" "$DEST"

# Ensure relative node_modules paths (one-level up from each deck)
# (In case a template used a different path, normalize them)
sed -i \
  -e 's|href="node_modules/reveal.js/|href="../node_modules/reveal.js/|g' \
  -e 's|src="node_modules/reveal.js/|src="../node_modules/reveal.js/|g' \
  "$DEST/index.html" || true

# Title substitutions in index.html and slides.md (non-destructive if placeholders absent)
sed -i "s|<title>.*</title>|<title>${TITLE}</title>|" "$DEST/index.html" || true
sed -i "1s|^# .*|# ${TITLE}|" "$DEST/slides.md" || true

echo "Created: $DEST"
echo "Run with:"
echo "  TALK=${FOLDER} npm run dev"
echo "Export PDF:"
echo "  TALK=${FOLDER} npm run pdf"
