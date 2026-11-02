#!/usr/bin/env bash
# Commit everything and push to GitHub.
# Commits are numbered 1, 2, 3, ... (next number = current commit count + 1).
set -euo pipefail
cd "$(dirname "$0")"

git add -A
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  n=$(( $(git rev-list --count HEAD 2>/dev/null || echo 0) + 1 ))
  git commit -m "$n"
  echo "Created commit $n"
fi

git push -u origin main
