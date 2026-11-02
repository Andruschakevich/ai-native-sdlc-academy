# Domain Model — Subscription Management

## Core entities
| Entity | Meaning | Key attributes |
|---|---|---|
| Account | Customer organization or account | accountId, status, type |
| User | Authenticated actor | userId, accountId, roles |
| Subscription | Contracted product access | subscriptionId, accountId, planId, status, periodStart, periodEnd |
| Plan | Commercial package | planId, price, interval, limits, capabilities |
| Billing Cycle | Recurring billing period | interval, anchorDate, nextBillingAt |
| Payment | Financial transaction | paymentId, amount, currency, status, providerReference |
| Discount | Price adjustment | discountId, type, validity, eligiblePlans |
| Scheduled Change | Future transition | changeId, targetPlan, effectiveAt, status |
| Entitlement | Effective access or quota | accountId, capability, limit, effectiveFrom |
| Audit Event | Record of action and decision | eventId, actor, action, timestamp, correlationId |

## Lifecycle states
Illustrative states: TRIAL, ACTIVE, PAST_DUE, PAUSED, CANCEL_AT_PERIOD_END, CANCELED and EXPIRED. A scheduled downgrade or cycle change is stored separately from the currently effective subscription.

## Invariants
1. A subscription has one authoritative current plan at any instant.
2. A scheduled change does not alter current entitlements before effective time.
3. Immediate upgrade is not activated before required payment success.
4. Failed payment leaves existing effective subscription and entitlements unchanged.
5. Duplicate requests/events do not duplicate charges or state transitions.
6. Entitlements converge to effective subscription state.
7. Discounts apply only when Promotion policy confirms compatibility and validity.
8. Downgrade never silently deletes customer data.
9. Only authorized account Admin can initiate permitted actions.
10. Billing Owner approval is required for defined financial consequences.
11. Every transition has actor, timestamp and correlation evidence.

## Ownership assumptions
Subscription Service owns lifecycle; Billing Service owns billing calculations/ledger; Payment Provider owns external payment outcome; Promotion Service owns discount eligibility; Entitlement Service owns effective access. Discovery must validate these boundaries.

## Important distinctions
Requested plan is not necessarily effective plan. Payment authorized is not necessarily payment settled. Active subscription does not prove entitlements are synchronized. Cancel renewal is not immediate access revocation. Scheduled change is not a completed transition.