# Independent Verification Report — Training Example

**Subject:** Subscription Management feature package  
**Status:** NOT VERIFIED — this is an evidence checklist, not a claim of executed tests.

## Review method
1. Read approved Business Intent, requirements, rules and acceptance criteria.
2. Inspect complete code diff and affected contracts.
3. Run deterministic tests and CI checks independently.
4. Check traceability from each requirement to test evidence.
5. Review security, concurrency, failure handling and operational readiness.

## Required evidence
| Area | Evidence required | Current status |
|---|---|---|
| Functional requirements | AC-linked tests | Not run; no application implementation |
| Payment invariants | Success/failure and duplicate tests | Not run |
| Authorization | Role and tenant-isolation tests | Not run |
| Entitlement consistency | Failure injection and reconciliation | Not run |
| Contracts | Consumer/provider contract results | Not run |
| Security | SAST, dependency/secret scan and review | Not run |
| Operations | Dashboards, alerts and recovery drill | Not run |

## Decision
REJECTED / NOT VERIFIED until executable implementation and evidence are supplied. Documentation completeness does not equal production readiness.