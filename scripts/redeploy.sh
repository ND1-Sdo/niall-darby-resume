#!/usr/bin/env bash
# Regenerate PDF, commit, and push — Render auto-deploys from main.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "==> Regenerating PDF…"
bash "$ROOT/scripts/generate-resume-pdf.sh"

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
