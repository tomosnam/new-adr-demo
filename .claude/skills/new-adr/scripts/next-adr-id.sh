#!/usr/bin/env bash
# Prints the next free ADR ID (e.g. DM-0003) by scanning an ADR folder.
# Usage: next-adr-id.sh [adr-dir] [prefix]
#   adr-dir  folder with ADR files (default: docs/adr)
#   prefix   ID prefix (default: DM)
set -euo pipefail

ADR_DIR="${1:-docs/adr}"
PREFIX="${2:-DM}"

if [[ ! -d "$ADR_DIR" ]]; then
  echo "${PREFIX}-0001"
  exit 0
fi

# Find the highest number in files named like DM-0007-something.md
max=$(ls "$ADR_DIR" 2>/dev/null \
  | grep -oE "^${PREFIX}-[0-9]{4}" \
  | sed -E "s/^${PREFIX}-0*//" \
  | sort -n \
  | tail -1 || true)

next=$(( ${max:-0} + 1 ))
printf "%s-%04d\n" "$PREFIX" "$next"
