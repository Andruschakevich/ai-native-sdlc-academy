# System Context — Subscription Platform

**Evidence status:** synthetic training baseline. Validate every component against a real repository in an actual engagement.

## System boundary
A browser product manages subscriptions. Internal services own authorization, subscription state, billing calculations, entitlements, promotions and notifications. An external payment provider processes payment intents and sends asynchronous events.

## Context map
| Component | Responsibility | Candidate source of truth | Status |
|---|---|---|---|
| Web Frontend | Display, preview and confirmation | None; presentation only | Assumed |
| Identity & Access | Users, roles and account membership | Identity service | Assumed |
| Subscription API | Authenticated use-case boundary | None; delegates state | Assumed |
| Subscription Service | Lifecycle and scheduled changes | Subscription DB | Assumed |
| Billing Service | Invoice, quote and billing schedule | Billing ledger/provider contract | Assumed |
| Payment Adapter | Provider integration and normalized events | External provider for payment outcome | Assumed |
| Entitlement Service | Effective access and limits | Entitlement store | Assumed |
| Promotion Service | Discount eligibility | Promotion rules/store | Assumed |
| Notification Service | Receipts and reminders | Delivery provider status | Assumed |
| Analytics | Funnel and outcome events | Analytics warehouse | Assumed |
| Support Analytics | Contact reasons and volume | Support platform | Assumed |

## Flows to inspect
1. Authentication, account membership and Admin/Billing Owner authorization.
2. Subscription read path and authoritative state.
3. Price preview and billing calculation.
4. Payment intent and confirmation.
5. Webhook signature validation, deduplication and retries.
6. Subscription transition and scheduled changes.
7. Entitlement update and reconciliation.
8. Discount compatibility.
9. Notifications, audit and analytics.
10. CI/CD, feature flags, monitoring, alerts and incident process.

## Exercise constraints
Provider events may be duplicated or delayed; subscription and entitlement state may live in separate services; successful payment does not prove entitlement update; database rollback cannot reverse external payment; user confirmation must reflect authoritative operation state.

## Evidence record format
For each finding record ID, statement, evidence location (file/line, API contract, schema, test, log or owner interview), evidence type (observed/inferred/unknown), confidence, impact if wrong and follow-up action. Do not fabricate source paths.

## Readiness criteria
- [ ] Service ownership and sources of truth confirmed.
- [ ] API and event contracts inspected.
- [ ] State transitions and side effects traced.
- [ ] Billing and entitlement reconciliation understood.
- [ ] Security boundaries and roles confirmed.
- [ ] CI/CD, feature flags and rollback limitations understood.
- [ ] Critical findings independently reviewed.