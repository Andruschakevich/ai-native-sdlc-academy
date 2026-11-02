# Test Scenarios — Subscription Management

Scenarios are mapped to approved training requirements and ACs. They describe expected verification evidence; they are not claims that executable tests have been run.

| Test | Requirement / AC | Scenario | Expected evidence |
|---|---|---|---|
| TS-01 | FR-01 / AC-01 | Admin views own subscription | API/UI contract and account-scope test |
| TS-02 | FR-01 / AC-01 | User from another account requests subscription | Tenant-isolation rejection |
| TS-03 | FR-02 / AC-02 | Enterprise subscription requests self-service | Eligibility rejection; no billing command |
| TS-04 | FR-02 / AC-02 | Overdue or disputed account requests operation | Ineligible response with reason |
| TS-05 | FR-03 / AC-03 | Preview compatible discount | Correct price, currency, date and discount |
| TS-06 | FR-03, FR-10 / AC-03, AC-12 | Preview incompatible discount | Discount loss and resulting price disclosed |
| TS-07 | FR-04 / AC-04 | Upgrade payment succeeds | Correlated payment, subscription and entitlement evidence |
| TS-08 | FR-04 / AC-05 | Upgrade payment declined | Existing plan and entitlements unchanged |
| TS-09 | FR-04, NFR-01 / AC-13 | Admin without Billing Owner requests immediate charge | Approval pending; no capture before approval |
| TS-10 | FR-05 / AC-06 | Downgrade confirmed | Scheduled next-cycle change; current access retained |
| TS-11 | FR-11 / AC-07 | Usage exceeds target limit | Blocked with explanation; no deletion |
| TS-12 | FR-06 / AC-08 | Monthly-to-annual change | New price/effective date; next-cycle scheduling |
| TS-13 | FR-06 / AC-08 | Annual-to-monthly change | New price/effective date; next-cycle scheduling |
| TS-14 | FR-07 / AC-09 | Cancel renewal | Renewal disabled; access retained through paid-through date |
| TS-15 | FR-08 / AC-10 | Pause on unsupported plan | Operation unavailable with reason |
| TS-16 | FR-08 / AC-10 | Pause for 1 and 3 months | Valid boundaries accepted |
| TS-17 | FR-08 / AC-10 | Pause for 0 or 4 months | Rejected; no state transition |
| TS-18 | FR-09 / AC-10 | Resume with next charge due | Price/date disclosed before confirmation |
| TS-19 | FR-09 / AC-11 | Reactivate eligible canceled subscription | Price and approval/payment flow verified |
| TS-20 | FR-12, NFR-03 / AC-14 | Duplicate command and webhook | One logical business effect |
| TS-21 | NFR-02, NFR-04 / AC-15 | Entitlement update fails after payment | Reconciliation created; incomplete state visible |
| TS-22 | NFR-05, NFR-09 / AC-16 | Trace operation across services | Correlation ID and audit completeness |
| TS-23 | FR-13 / AC-17 | Notification provider unavailable | Retry notification without repeating operation |
| TS-24 | FR-14 / AC-18 | Analytics sink unavailable | Event retained/retried; financial flow unaffected |
| TS-25 | NFR-06 | Inspect logs and agent context | No secrets or unnecessary personal data |
| TS-26 | NFR-07 | Preview API under agreed load profile | SLO evidence; threshold from approved baseline |
| TS-27 | NFR-08 | Keyboard/screen-reader subscription flow | Accessibility test evidence |
| TS-28 | NFR-10 | Simulate critical canary invariant breach | Rollout halts; recovery path exercised |

## Failure-injection cases
- Provider timeout after a charge may have been captured.
- Duplicate and out-of-order webhook.
- Concurrent upgrade and cancel.
- Stale price preview after discount expiry.
- Billing Owner approval revoked before capture.
- Subscription transition committed but entitlement event lost.
- Notification/analytics delivery fails independently.
