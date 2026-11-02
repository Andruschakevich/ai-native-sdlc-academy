# Business Intent — Self-Service Subscription Management

**Version:** 1.0  
**Status:** GO — approved for Product & System Discovery (training scenario)  
**Decision owner:** Fictional Product Owner  
**Reviewed:** 2026-11-02

## Business context
Customers rely on Customer Support for subscription-management operations. This creates avoidable support workload and slows customers who want to manage plans and billing preferences themselves.

## Problem statement
Eligible account administrators cannot reliably complete common subscription operations without Support. The baseline is approximate and must be validated using Support analytics normalized by active subscriptions.

## Target users
- **Admin:** manages subscription configuration for an account.
- **Billing Owner:** accountable for payment methods and approval of immediate financial consequences.
- **Customer Support:** handles excluded, exceptional or disputed cases.

## Desired outcome
Enable eligible customers to manage subscriptions through a transparent self-service experience while preserving billing correctness, payment integrity, entitlements, discounts and trust.

## Success metrics
| Metric | Training target | Measurement |
|---|---:|---|
| Subscription-management Support contacts | Reduce ≥30% within 3 months | Support tags normalized per active subscription |
| Self-service completion | ≥85% | Completed eligible flows / eligible started flows |
| Successful operations without Support | ≥90% | Successful eligible operations not escalated |
| Median completion time | ≤3 minutes | Product funnel timestamps |
| Billing complaints | No material increase | Tagged complaints per active subscription |
| Refund rate and churn | No material increase | Cohort comparison |

Targets are training hypotheses, not actual results. Baselines and attribution must be validated.

## Scope
**In scope:** upgrade, downgrade, monthly/annual cycle change, cancel renewal, pause/resume on eligible plans, reactivate eligible subscriptions, price/effective-date preview, audit and notification.

**Out of scope:** enterprise negotiated contracts, bespoke legacy terms, active billing disputes, overdue balances, manual commercial negotiations, automatic deletion of customer data and actions that bypass required Billing Owner approval.

## Approved business rules summary
1. Upgrade is immediate after required confirmation and successful payment.
2. Downgrade and cycle changes take effect next billing cycle.
3. Cancel stops renewal but preserves paid access through period end.
4. Pause is 1–3 months and only on eligible plans.
5. Resume shows next charge and date.
6. Compatible discounts are preserved; incompatible discounts are disclosed, not silently transferred.
7. Downgrade is blocked if usage exceeds target limits; no data is deleted.
8. Admin initiates permitted actions; Billing Owner approves immediate financial consequences.
9. Every operation is idempotent, auditable and observable.

See [business rules](../03-specification/business-rules.md) for the full rule set.

## Constraints
Preserve billing/payment/subscription/entitlement invariants; enforce account-scoped authorization; do not expose secrets; use idempotency for commands and webhooks; retain auditability; define progressive rollout and recovery.

## Assumptions and confidence
| Assumption | Confidence | Validation |
|---|---|---|
| Support contacts can be tagged by reason | Medium | Inspect taxonomy and sample tickets |
| Analytics identifies eligible flow starts/completions | Medium | Validate event coverage |
| Provider supports payment intents and webhooks | Low | Inspect provider contract |
| Subscription state has one authoritative owner | Low | Trace actual persistence and writes |
| Entitlements can be reconciled asynchronously | Low | Inspect event flow and recovery jobs |

## Risks
| Risk | Mitigation |
|---|---|
| Incorrect billing/proration | Authoritative billing quote, approval and contract tests |
| Duplicate requests or webhooks | Idempotency and deduplication |
| Entitlement drift | Source of truth, reconciliation and rollout gate |
| Discount unexpectedly removed | Preview resulting price before confirmation |
| Unauthorized Admin action | RBAC, Billing Owner gate and audit |
| Downgrade exceeds limits | Block; never delete data automatically |
| Support reduction masks user failure | Pair KPI with completion, complaints, refunds and churn |

## Open questions
The training Product Owner resolves assumptions to allow the course to proceed. A real product must confirm tax treatment, jurisdictional requirements, exact proration formula, pause eligibility, retention policy and provider payment semantics.

## Decision
**GO for Product & System Discovery only.** This is not authorization to implement, deploy or change production. Discovery must validate the system assumptions.

## Approval
- Product decision owner: Fictional Product Owner
- Status: Approved for Discovery
- Engineering approval: required at architecture and implementation gates
- Release approval: governed by [approval matrix](../../governance/approval-matrix.md)