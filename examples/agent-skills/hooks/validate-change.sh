#!/usr/bin/env bash
# Illustrative local validation hook. Review and adapt before enabling.
# Read-only: it does not modify repository files.
set -euo pipefail

if [[ ! -d .git ]]; then
  echo "Not inside a Git repository; skipping repository-specific validation."
  exit 0
fi

git diff --check
echo "Whitespace and patch checks passed."
