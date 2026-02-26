#!/usr/bin/env bash
set -euo pipefail

CATEGORIES=("brands" "clients" "partners" "tech" "social")

usage() {
  echo "Usage: $0 <category> <name> <file>"
  echo ""
  echo "Categories: ${CATEGORIES[*]}"
  echo ""
  echo "Examples:"
  echo "  $0 brands atomtech ./atomtech-logo.svg"
  echo "  $0 clients acme ./acme-logo.png"
  echo "  $0 tech nextjs ./nextjs-logo.svg"
  exit 1
}

# Validate args
[[ $# -ne 3 ]] && usage

CATEGORY="$1"
NAME="$2"
FILE="$3"

# Validate category
valid=false
for c in "${CATEGORIES[@]}"; do
  [[ "$CATEGORY" == "$c" ]] && valid=true && break
done
if [[ "$valid" == false ]]; then
  echo "Error: Invalid category '$CATEGORY'"
  echo "Valid categories: ${CATEGORIES[*]}"
  exit 1
fi

# Validate file exists
if [[ ! -f "$FILE" ]]; then
  echo "Error: File not found: $FILE"
  exit 1
fi

# Get extension
EXT="${FILE##*.}"
DEST="logos/${CATEGORY}/${NAME}/logo.${EXT}"

# Create destination dir and copy
mkdir -p "logos/${CATEGORY}/${NAME}"
cp "$FILE" "$DEST"

echo "Added: $DEST"
echo ""

# Stage and commit
git add "$DEST"
git commit -m "add ${CATEGORY}/${NAME} logo"

echo ""
echo "CDN URL (available after push):"
echo "https://cdn.jsdelivr.net/gh/atomtech/brand-assets@main/${DEST}"
