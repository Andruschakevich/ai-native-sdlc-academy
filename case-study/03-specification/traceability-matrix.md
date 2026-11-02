# Requirements Traceability Matrix

| Requirement | Acceptance criteria | Test scenarios | Evidence |
|---|---|---|---|
| FR-01 | AC-01 | TS-01 | API/UI contract test |
| FR-02 | AC-04, AC-06 | TS-02, TS-10 | Eligibility tests |
| FR-03 | AC-05, AC-07 | TS-03, TS-08, TS-11 | Preview contract/UI tests |
| FR-04 | AC-01, AC-02 | TS-04, TS-05 | Payment/subscription integration evidence |
| FR-05 | AC-03 | TS-06 | Scheduled state transition test |
| FR-06 | AC-05 | TS-08 | Billing-cycle transition test |
| FR-07 | AC-06 | TS-09 | Renewal/access boundary test |
| FR-08 | AC-03 precondition | TS-10 | Pause eligibility test |
| FR-09 | AC-05 | TS-11 | Resume/reactivation test |
| FR-10 | AC-07 | TS-03 | Promotion compatibility test |
| FR-11 | AC-04 | TS-07 | Usage-limit negative test |
| FR-12 | AC-09 | TS-12 | Idempotency/deduplication test |
| NFR-01 | AC-08 | TS-13 | Authorization tests |
| NFR-02 | AC-01, AC-02 | TS-04, TS-05 | Payment invariant tests |
| NFR-03 | AC-09 | TS-12 | Retry and duplicate tests |
| NFR-04 | AC-10 | TS-14 | Reconciliation failure-injection test |
| NFR-05 | — | TS-15 | Correlated trace/log evidence |
| NFR-06 | — | TS-16 | Secret scan and log review |
| NFR-09 | — | TS-17 | Audit record validation |
| NFR-10 | — | TS-18 | Rollout simulation |

A requirement without a verification path is not ready for autonomous implementation.