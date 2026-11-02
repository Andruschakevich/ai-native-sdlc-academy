# Test Scenarios

| Test | Requirement | Scenario | Expected evidence |
|---|---|---|---|
| TS-01 | FR-01 | Admin views subscription | API/UI show authoritative plan and status |
| TS-02 | FR-02 | Enterprise account requests change | Eligibility rejection with reason |
| TS-03 | FR-03/10 | Incompatible discount | Preview shows new price and discount loss |
| TS-04 | FR-04 | Upgrade payment succeeds | Correlated payment, subscription and entitlement evidence |
| TS-05 | FR-04 | Upgrade payment declined | No effective plan or entitlement change |
| TS-06 | FR-05 | Downgrade confirmed | Scheduled next-cycle change; current entitlement retained |
| TS-07 | FR-11 | Usage exceeds target limit | Block and explain; no deletion |
| TS-08 | FR-06 | Monthly-to-annual change | New price/effective date and scheduled transition |
| TS-09 | FR-07 | Cancel renewal | Renewal disabled; paid access retained |
| TS-10 | FR-08 | Pause unsupported plan | Operation unavailable with reason |
| TS-11 | FR-09 | Resume with charge due | Charge date and amount shown before confirmation |
| TS-12 | FR-12 | Duplicate command and webhook | One logical operation |
| TS-13 | NFR-01 | Admin lacks Billing Owner role | Approval required; no charge before approval |
| TS-14 | NFR-04 | Entitlement update fails | Reconciliation record and blocked completion |
| TS-15 | NFR-05 | Trace operation end-to-end | Correlation ID across logs/events |
| TS-16 | NFR-06 | Inspect logs and agent context | No secrets or unnecessary personal data |
| TS-17 | NFR-09 | Audit changes | Actor, time, decision and state history |
| TS-18 | NFR-10 | Simulate canary invariant breach | Rollout halts and recovery starts |