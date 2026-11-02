# Requirements Traceability Matrix

Each must-have requirement has acceptance criteria and a verification path. Test IDs refer to [test-scenarios.md](test-scenarios.md).

| Requirement | Acceptance criteria | Test scenarios | Evidence |
|---|---|---|---|
| FR-01 | AC-01 | TS-01, TS-02 | API/UI contract and tenant-isolation tests |
| FR-02 | AC-02 | TS-03, TS-04 | Eligibility negative tests |
| FR-03 | AC-03 | TS-05, TS-06 | Preview contract/UI tests |
| FR-04 | AC-04, AC-05 | TS-07, TS-08, TS-09 | Payment/subscription integration evidence |
| FR-05 | AC-06 | TS-10 | Scheduled transition test |
| FR-06 | AC-08 | TS-12, TS-13 | Billing-cycle transition tests |
| FR-07 | AC-09 | TS-14 | Renewal/access boundary test |
| FR-08 | AC-10 | TS-15, TS-16, TS-17, TS-18 | Pause/resume eligibility and timing tests |
| FR-09 | AC-11 | TS-19 | Reactivation integration test |
| FR-10 | AC-12 | TS-06 | Promotion compatibility test |
| FR-11 | AC-07 | TS-11 | Usage-limit negative test |
| FR-12 | AC-14 | TS-20 | Idempotency and event-deduplication tests |
| FR-13 | AC-17 | TS-23 | Notification retry test |
| FR-14 | AC-18 | TS-24 | Analytics outbox/retry test |
| NFR-01 | AC-13 | TS-02, TS-09 | Authorization and account-isolation tests |
| NFR-02 | AC-04, AC-05 | TS-07, TS-08 | Payment invariant tests |
| NFR-03 | AC-14 | TS-20 | Retry, duplicate command and webhook tests |
| NFR-04 | AC-15 | TS-21 | Reconciliation failure-injection test |
| NFR-05 | AC-16 | TS-22 | Correlated trace/log evidence |
| NFR-06 | — | TS-25 | Secret scan and log review |
| NFR-07 | — | TS-26 | Load/latency evidence against approved SLO |
| NFR-08 | — | TS-27 | Accessibility test report |
| NFR-09 | AC-16 | TS-22 | Audit record validation |
| NFR-10 | — | TS-28 | Rollout halt and recovery simulation |

## Coverage rules
1. Every Must requirement must map to at least one AC.
2. Every critical business rule must map to at least one negative/failure scenario.
3. Every AC must map to at least one test scenario.
4. Every test scenario must map to an approved requirement or NFR.
5. A test passing is evidence for the tested condition, not proof of the entire product.
6. No implementation package may be marked READY while critical traceability gaps remain.
