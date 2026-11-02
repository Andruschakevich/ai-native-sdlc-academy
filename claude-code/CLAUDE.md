# Repository Agent Contract

## Purpose
This repository contains the fictional Subscription Management training case. Follow source-of-truth artifacts; do not invent product rules.

## Read first
1. case-study/01-intent/business-intent.md
2. case-study/02-discovery/system-context.md
3. case-study/02-discovery/domain-model.md
4. case-study/03-specification/requirements.md
5. case-study/03-specification/business-rules.md
6. case-study/04-architecture/architecture-overview.md
7. Assigned work package and linked acceptance criteria.

## Working rules
- Separate observed facts, assumptions, hypotheses and decisions.
- If business rules conflict or a critical rule is missing, stop and ask.
- Do not expand scope beyond the assigned work package.
- Inspect existing code and tests before proposing changes.
- For non-trivial work, report a plan and dependencies before editing.
- Preserve API, data, security and business invariants.
- Add/update tests from approved requirements.
- Never weaken or delete a failing test merely to get green.
- Do not access production data, secrets or payment credentials.
- Do not execute deployment, destructive data operations or real payment actions.
- Inspect the final diff and report evidence, limitations and unresolved risks.

## Completion report
Return summary, changed files, requirements addressed, tests/commands and outcomes, evidence links, deviations, risks and status READY_FOR_REVIEW or BLOCKED. Never self-approve release.