# ADR-002: Entitlement Reconciliation After Subscription Changes

- Status: Accepted for fictional training architecture
- Decision owners: Subscription Domain and Entitlement Engineering Owners

## Context
Payment, subscription lifecycle and entitlement state are owned by separate logical components. A payment can succeed and the subscription transition can commit while entitlement delivery fails or is delayed. A green payment response alone must not be reported as complete product access.

## Decision
Treat entitlement update as an independently observable step correlated to the subscription operation. Use durable event/outbox delivery where appropriate, idempotent consumers and a reconciliation process that compares effective subscription state with entitlement state. The operation remains incomplete until the defined entitlement condition is met or an explicit recovery/exception state is recorded.

## Consequences
- The workflow must distinguish PAYMENT_CONFIRMED, SUBSCRIPTION_UPDATED, ENTITLEMENTS_PENDING and COMPLETED.
- Event retries must not duplicate entitlement grants.
- Reconciliation needs ownership, lag monitoring and an auditable repair process.
- The user-facing status must not claim full completion prematurely.
- Exact consistency window and repair policy require product SLO and service-owner agreement.

## Alternatives
- Synchronous cross-service transaction: not assumed available and creates tight coupling.
- Trust payment success: violates access correctness.
- Manual support-only repair: insufficient for recurring delivery failures.
- Blindly replay all events: may duplicate side effects without idempotency.

## Validation
Failure-inject entitlement service outage; duplicate event; delayed event; out-of-order event; replay after consumer restart; compare effective plan to entitlement projection; verify rollout halt threshold.

## Open decisions
Exact convergence SLO, source-of-truth query, dead-letter handling, and whether user receives pending status or support escalation after timeout.
