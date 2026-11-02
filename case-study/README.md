# Subscription Management — Fictional Brownfield Case Study

A fictional existing subscription product is used throughout the academy. The exercise introduces self-service management without breaking billing, payment, entitlement or discount behavior. All names and rules are synthetic.

## Business request
Allow account administrators to manage subscriptions themselves, reducing Support workload and improving customer experience while preserving billing and subscription integrity.

## Included operations
Upgrade; downgrade; monthly/annual billing-cycle change; cancel renewal; pause/resume on eligible plans; reactivate an eligible subscription.

## Training decisions
- Upgrade is effective immediately after required confirmation and successful payment.
- Downgrade and billing-cycle changes take effect next billing cycle.
- Cancellation stops renewal; paid access remains through paid-through date.
- Pause is 1–3 months only on eligible plans.
- Resume discloses next charge and date.
- Admin manages settings; Billing Owner approves immediate financial consequences and payment-method changes.
- Compatible discounts are preserved. Incompatible discounts are not silently transferred; resulting price is disclosed.
- Downgrade is blocked if usage exceeds target limits; data is never deleted automatically.
- Enterprise negotiated terms, bespoke legacy plans, active disputes, overdue balances and manual commercial negotiations are excluded.

## Training targets
| Metric | Target |
|---|---:|
| Subscription-management Support contacts | -30% within 3 months |
| Self-service completion | ≥85% |
| Successful operations without Support | ≥90% |
| Median completion time | ≤3 minutes |
| Billing complaints, refunds and churn | No material increase |

Targets are hypotheses, not measured results. Validate baseline and attribution before launch.

## Synthetic system landscape
Web Frontend; Identity & Access; Subscription API and Service; Billing Service; Payment Provider Adapter; Entitlement Service; Promotion Service; Notification Service; Analytics and Support Analytics. See [system context](02-discovery/system-context.md).

Use the [artifact index](ARTIFACT-INDEX.md). The detailed [WP-05 Immediate Upgrade Task Packet](05-execution/task-packet-WP-05.md) demonstrates how the specification and architecture are handed to an implementation agent. The [logical API and event contracts](04-architecture/api-contracts.md) and ADRs show the proposed integration boundaries. Update upstream decisions first and review downstream impacts. These are educational assumptions, not universal subscription rules.