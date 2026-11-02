---
name: implement-work-package
description: Execute one approved work package with bounded scope and verifiable evidence.
---

# Implement Work Package

## Before editing
1. Read assigned work package and linked requirements, rules and ADRs.
2. Confirm status is READY and dependencies are complete.
3. Inspect existing code, tests and local conventions.
4. Identify shared files, side effects and risks.
5. If specification is ambiguous or conflicts with evidence, stop and request clarification.

## Execution
1. State exact scope and exclusions.
2. Write a short plan for non-trivial changes.
3. Implement only the assigned package.
4. Add/update tests from acceptance criteria.
5. Run relevant local checks.
6. Inspect complete diff for unrelated edits and security issues.
7. Do not weaken tests or silently change requirements.

## Report
List changed files, requirements addressed, tests and exact outcomes, evidence, deviations, remaining risks and status. Use READY_FOR_REVIEW or BLOCKED; never self-approve.