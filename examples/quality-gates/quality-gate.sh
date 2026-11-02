#!/usr/bin/env bash
# Minimal illustrative CI quality gate. Adapt commands to the actual project.
set -euo pipefail

echo "Running whitespace validation..."
git diff --check

if [[ -f package.json ]]; then
  echo "Node project detected."
  if node -e "const p=require('./package.json'); process.exit(p.scripts && p.scripts.test ? 0 : 1)"; then
    npm test
  else
    echo "No test script found in package.json; configure a project-specific test command." >&2
    exit 1
  fi
else
  echo "No package.json found. Add project-specific deterministic checks before using this gate in CI."
fi

echo "Configured quality checks passed."
