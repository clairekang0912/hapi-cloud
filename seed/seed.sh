#!/usr/bin/env bash
set -euo pipefail
BASE="${1:-http://localhost:8080/fhir}"

post() {
  f="$1"
  echo "→ $f"
  curl -sS -X POST -H "Content-Type: application/fhir+json" --data @"$f" "$BASE" >/dev/null
  echo "✓ $f"
}

shopt -s nullglob
for f in seed/refs/*.json;     do post "$f"; done
for f in seed/patients/*.json; do post "$f"; done

echo "Done. Check: $BASE/Patient"
