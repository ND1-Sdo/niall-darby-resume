#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
HTML="file://${ROOT}/resume-print.html"
OUT="${ROOT}/assets/Niall_Darby_Resume.pdf"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

if [[ ! -x "$CHROME" ]]; then
  echo "Google Chrome not found. Open resume-print.html and Print → Save as PDF."
  exit 1
fi

"$CHROME" \
  --headless=new \
  --disable-gpu \
  --no-pdf-header-footer \
  --virtual-time-budget=8000 \
  --print-to-pdf="$OUT" \
  "$HTML"

echo "Generated: $OUT"
