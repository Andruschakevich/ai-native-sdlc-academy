# Domain Model — Subscription Management

**Status:** synthetic training domain model. In a real product, validate definitions, relationships and state transitions with domain owners and repository evidence.

## 1. Domain overview
The domain manages an account's commercial subscription, recurring billing obligations and effective product access. Subscription lifecycle, payment settlement and entitlement delivery are related but distinct concepts.

## 2. Core entities

| Entity | Meaning | Important attributes |
|---|---|---|
| Account | Customer organization or account boundary | accountId, status, type, jurisdiction |
| User | Authenticated person acting for an account | userId, accountId, roles, status |
| Subscription | Contractual product subscription | subscriptionId, accountId, planId, status, periodStart, periodEnd |
| Plan | Commercial package | planId, price, currency, interval, limits, capabilities |
| Billing Cycle | Recurring billing schedule | interval, anchorDate, nextBillingAt |
| Payment | Financial attempt/transaction | paymentId, amount, currency, status, providerReference |
| Invoice | Billable obligation and accounting document | invoiceId, amountDue, currency, status, dueAt |
| Discount | Price adjustment with eligibility | discountId, type, validity, eligiblePlans, stackingPolicy |
| Scheduled Change | Future subscription transition | changeId, targetPlan/cycle, effectiveAt, status |
| Entitlement | Effective access/quota | accountId, capability, limit, effectiveFrom |
| Operation | One logical requested state transition | operationId, idempotencyKey, fingerprint, status |
| Audit Event | Evidence of action and decision | eventId, actor, action, timestamp, correlationId |

## 3. Relationships
- An Account has one or more Users and may have one or more Subscriptions.
- A User acts within an Account and has account-scoped roles.
- A Subscription references one effective Plan and one billing schedule.
- A Subscription may have zero or more Payments, Invoices and Discounts over time.
- A Subscription may have a pending Scheduled Change separate from its current effective plan.
- A Plan defines capabilities and usage limits; Entitlements represent the currently effective access.
- An Operation coordinates a logical transition and may correlate payment, subscription, entitlement and audit events.
- Audit Events record lifecycle actions and decisions.

These are conceptual relationships, not a proposed physical database schema.

## 4. Lifecycle and state model

Illustrative subscription states:
- TRIAL
- ACTIVE
- PAST_DUE
- PAUSED
- CANCEL_AT_PERIOD_END
- CANCELED
- EXPIRED

A scheduled downgrade or billing-cycle change is not itself the current subscription state. It is a pending transition with target and effective date.

Illustrative operation states:
`REQUESTED → ELIGIBILITY_CHECKED → AWAITING_APPROVAL → PAYMENT_PENDING → PAYMENT_CONFIRMED → SUBSCRIPTION_UPDATED → ENTITLEMENTS_PENDING → COMPLETED`

Alternative states include REJECTED, PAYMENT_FAILED, OUTCOME_UNKNOWN, RECONCILIATION_REQUIRED and CANCELLED. Exact state machine must be adapted to provider semantics and service ownership.

## 5. Business rules and invariants

1. A subscription has one authoritative effective plan at any instant.
2. A scheduled change does not alter current entitlements before effective time.
3. Immediate upgrade is not activated before required approval and payment success.
4. Failed payment leaves effective subscription and entitlements unchanged.
5. Duplicate commands/events do not duplicate charges or state transitions.
6. Entitlements converge to the effective subscription state.
7. Discounts apply only when Promotion policy confirms compatibility and validity.
8. Downgrade never silently deletes customer data.
9. Only an authorized account Admin can initiate permitted actions.
10. Billing Owner approval is required for defined immediate financial consequences.
11. Every transition has actor, timestamp and correlation evidence.
12. An uncertain external payment outcome is reconciled before retry or compensation.

See [Business Rules](../03-specification/business-rules.md) for normative training policy.

## 6. Domain events

Illustrative events:
- SubscriptionChangeRequested
- SubscriptionChangeRejected
- BillingOwnerApprovalRequested
- BillingOwnerApprovalGranted
- PaymentAttemptStarted
- PaymentOutcomeConfirmed
- PaymentOutcomeUnknown
- SubscriptionUpgraded
- SubscriptionChangeScheduled
- SubscriptionCancelledAtPeriodEnd
- SubscriptionPaused
- SubscriptionResumed
- SubscriptionReactivated
- EntitlementUpdateRequested
- EntitlementUpdateConfirmed
- ReconciliationRequired
- SubscriptionOperationCompleted

Events are conceptual. Real event names, schemas, delivery guarantees and ownership must be discovered.

## 7. Ownership assumptions

Subscription Service owns lifecycle; Billing Service owns billing calculations/ledger; Payment Provider owns external payment outcome; Promotion Service owns discount eligibility; Entitlement Service owns effective access. These are synthetic ownership assumptions requiring validation in a real system.

## 8. Important distinctions
- Requested plan is not necessarily effective plan.
- Payment authorized is not necessarily settled.
- Payment success is not proof of entitlement update.
- Cancel renewal is not immediate access revocation.
- Scheduled change is not completed transition.
- A read model/projection is not necessarily authoritative state.

## 9. Open questions for a real discovery
Tax jurisdiction and rounding; proration; provider idempotency retention; event ordering guarantees; pause eligibility; calendar/time-zone boundaries; entitlement convergence SLO; invoice handling; discount stacking; data retention; dispute lifecycle.

## 10. Evidence and confidence
In this academy, the above is the synthetic reference model. In a real brownfield discovery, attach file/symbol, schema, API, test or domain-owner evidence to each claim, plus confidence and impact if wrong.
