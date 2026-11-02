# Impact Analysis — Self-Service Subscription Management

| Component | Expected change | Risk | Verification focus |
|---|---|---|---|
| Web Frontend | Management UI, preview, confirmation | Medium | Accessibility, duplicate submit, stale preview |
| Identity & Access | Admin/Billing Owner checks | Critical | Account boundary, privilege escalation |
| Subscription API | Use cases and idempotency | High | Compatibility, authorization, rate limits |
| Subscription Service | Lifecycle and scheduled changes | Critical | Concurrency, invariants, persistence |
| Billing Service | Quote and next-cycle schedule | Critical | Rounding, tax, proration, invoice correctness |
| Payment Adapter | Payment intent and webhook handling | Critical | Signature, duplicate/out-of-order events |
| Entitlement Service | Effective access and limits | Critical | Event ordering, lag and reconciliation |
| Promotion Service | Discount compatibility | High | Eligibility and price disclosure |
| Notification Service | Confirmations and reminders | Medium | Duplicate messages and delivery failure |
| Analytics / Support Analytics | Funnel and outcome signals | Medium | Event definitions, baseline and normalization |
| CI/CD and Operations | Flags, rollout, alerts | High | Canary and recovery limitations |

## Cross-cutting risks
Distributed transaction across payment/subscription/entitlement; race between user actions and billing jobs; duplicate commands/webhooks; stale price preview; role confusion; irreversible external side effects.

## Recommended sequencing
Confirm domain and provider contracts first. Then implement eligibility and authorization, price/discount preview, idempotent commands, immediate upgrade payment, scheduled changes, entitlement reconciliation, audit/analytics and independent verification. Release only after all gates pass.