# Architecture Overview — Subscription Management

## Design goals
- Preserve ownership of subscription, billing, payment, promotion and entitlement state.
- Make transitions explicit, idempotent and auditable.
- Separate preview from command execution.
- Treat external payment events as asynchronous and possibly duplicated.
- Support progressive release, observation and recovery.

## Logical flow
1. Web Frontend requests current subscription and eligible actions.
2. Subscription API authenticates actor and checks account-scoped role.
3. Eligibility evaluates account, plan, dispute, overdue and usage constraints.
4. Billing and Promotion return authoritative preview: price, discount impact, effective date and next charge.
5. Admin confirms; Billing Owner approval is obtained when immediate financial impact exists.
6. API submits idempotent command.
7. Billing/payment workflow processes required payment.
8. Subscription Service commits transition or scheduled change.
9. Entitlement Service applies effective access; reconciliation handles divergence.
10. Audit, notification and analytics events are emitted reliably.

## Service responsibilities
| Component | Owns | Must not own |
|---|---|---|
| Subscription Service | Lifecycle and scheduled changes | Payment settlement truth |
| Billing Service | Quote, invoice and billing schedule | Product entitlements |
| Payment Adapter | Provider integration and normalized events | Commercial eligibility policy |
| Promotion Service | Discount eligibility | Subscription state |
| Entitlement Service | Effective access and limits | Billing ledger |
| Identity & Access | Actor and account roles | Product pricing |
| Orchestrator | Workflow coordination and state | Business truth or unrestricted permissions |

## Consistency model
Do not assume distributed ACID transaction across services. Use operation IDs, idempotency keys, outbox/event delivery, state guards, retries and reconciliation. Track PENDING_PAYMENT, PAYMENT_CONFIRMED, SUBSCRIPTION_UPDATED, ENTITLEMENTS_CONFIRMED and COMPLETED. A success message requires authoritative conditions.

## Security and operations
Enforce authorization server-side. Re-check Billing Owner approval before immediate charge. Keep payment secrets inside payment boundary. Agents use synthetic/redacted data and least privilege. Correlation IDs connect API, billing, provider, subscription and entitlement events. Critical invariant breaches halt rollout.

## Discovery caveat
This is a logical training architecture. Confirm actual ownership, persistence, contracts, consistency guarantees, provider capabilities and deployment topology before implementation.