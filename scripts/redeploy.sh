#!/usr/bin/env bash
# Regenerate PDF, commit, and push — Render auto-deploys from main.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "==> Regenerating PDF…"
bash "$ROOT/scripts/generate-resume-pdf.sh"

# Stamp footer so you can confirm the live site refreshed
STAMP="$(date '+%-d %b %Y %H:%M')"
if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' "s|<span id=\"site-version\">.*</span>|<span id=\"site-version\">Updated ${STAMP}</span>|" "$ROOT/index.html"
else
  sed -i "s|<span id=\"site-version\">.*</span>|<span id=\"site-version\">Updated ${STAMP}</span>|" "$ROOT/index.html"
fi

if git diff --quiet && git diff --cached --quiet; then
  echo "==> No changes to deploy."
  exit 0
fi

echo "==> Committing changes…"
git add -A
git commit -m "Redeploy: regenerate resume PDF and site updates"

echo "==> Pushing to GitHub (Render will auto-deploy)…"
git push

echo "==> Done. Live site updates in 1–2 minutes."
