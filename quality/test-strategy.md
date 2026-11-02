# Risk-Based Test Strategy

| Layer | Purpose | Subscription examples |
|---|---|---|
| Unit | Pure rules and state transitions | Discount compatibility, pause duration, eligibility |
| Component | Component with controlled dependencies | Subscription command handler |
| Contract | API/event compatibility | Payment webhook, billing quote, entitlement event |
| Integration | Multiple real components | Payment confirmation to subscription update |
| End-to-end | User-visible journey | Admin upgrade with Billing Owner approval |
| Resilience | Failure and retry behavior | Duplicate webhook, provider timeout, entitlement outage |
| Security | Authorization and data boundaries | Tenant isolation, role separation, replay |
| Production verification | Signals after controlled release | Payment failure, entitlement lag, Support contacts |

## Independence
Verification Agent reads approved requirements and actual diff directly. It must not accept the Implementation Agent summary as proof. It challenges test quality, uses independent fixtures where practical and creates negative cases.

## Mandatory invariants
- No immediate upgrade activation before required payment success.
- No duplicate charge or state transition on retry.
- No entitlement change before scheduled effective date.
- No Admin bypass of Billing Owner approval.
- No automatic data deletion on downgrade.
- Divergent payment/subscription/entitlement state is visible and reconciled.

## Test personas
Standard monthly; annual; compatible discount; incompatible discount; enterprise contract; overdue payment; active dispute; Admin without Billing Owner role; Billing Owner; subscription near period boundary; usage above downgrade limits.

## Exit criteria
All mandatory acceptance criteria have passing evidence; critical security/financial findings are closed; limitations are documented; data is synthetic; release readiness is assessed separately.