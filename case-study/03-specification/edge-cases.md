# Edge Cases and Failure Conditions

| ID | Scenario | Expected handling | Severity |
|---|---|---|---|
| EC-01 | Concurrent upgrade requests | Optimistic concurrency and idempotency | High |
| EC-02 | Double-click confirm | Reuse idempotency key; no duplicate payment | Critical |
| EC-03 | Provider timeout after submit | Query/reconcile payment status; no blind retry | Critical |
| EC-04 | Duplicate webhook | Deduplicate by provider event ID | Critical |
| EC-05 | Out-of-order webhook | Validate against authoritative state | Critical |
| EC-06 | Payment succeeds, entitlement fails | Keep incomplete and reconcile safely | Critical |
| EC-07 | Discount expires after preview | Recalculate and require renewed price confirmation | High |
| EC-08 | Plan unavailable after preview | Reject stale preview and show eligible plans | Medium |
| EC-09 | Usage changes before downgrade | Re-evaluate limits at confirmation | High |
| EC-10 | Billing Owner approval revoked | Re-check before financial action | Critical |
| EC-11 | Downgrade and cancel overlap | Deterministic conflict policy | High |
| EC-12 | Pause ends at billing boundary | Explicit timezone and calendar rule | High |
| EC-13 | Notification fails | Retry notification separately | Medium |
| EC-14 | Analytics event fails | Retry via outbox; do not block financial transition | Medium |
| EC-15 | Enterprise or disputed account | Mark ineligible and direct to Support | High |
| EC-16 | Currency/tax jurisdiction changes | Require authoritative quote; never infer totals | Critical |