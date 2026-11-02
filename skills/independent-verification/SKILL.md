---
name: independent-verification
description: Independently verifies an implemented work package against approved requirements, acceptance criteria, invariants and risk controls.
---

# Independent Verification

## Inputs
- Approved Business Intent, Domain Model and Business Rules
- Approved requirements and acceptance criteria
- ADRs and assigned Task Packet
- Complete source diff and repository revision
- Test results and risk classification

## Independence rules
1. Do not treat the implementation report as proof.
2. Derive expected behavior from approved artifacts.
3. Inspect actual changed files and relevant call paths.
4. Review whether tests assert the requirement rather than mirror implementation.
5. Run permitted checks independently where possible.
6. Do not modify implementation code.
7. Do not mark business decisions approved.
8. Every finding includes reproducible evidence.

## Workflow
1. Confirm input versions and work-package scope.
2. Inspect complete diff and changed contracts.
3. Map changes to requirements and ACs.
4. Assess positive, negative, boundary and failure coverage.
5. Check security, data integrity, concurrency, idempotency and audit.
6. Run permitted tests/scans and record exact commands/results.
7. Classify findings by severity and impact.
8. Return VERIFIED, VERIFIED_WITH_NON_BLOCKING_FINDINGS, NEEDS_FIX or BLOCKED.

## Finding format
ID, severity, category, requirement/AC, evidence, expected, actual, impact, recommendation, owner and status.

## Restrictions
- No production access or mutation.
- No merge/deployment.
- No self-approval.
- Critical/High findings block progression unless a specifically authorized risk acceptance process applies.
