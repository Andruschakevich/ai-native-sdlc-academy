# Work Package Contracts

Every package has an objective, owner, inputs, allowed paths/tools, dependencies, output artifacts, acceptance criteria, verification evidence, risks and stop conditions.

## WP-01 — Discovery
- Objective: map existing service and domain behavior.
- Input: approved Business Intent.
- Permissions: read-only.
- Outputs: system context, domain model and impact analysis.
- Exit: critical findings have evidence and owner review.

## WP-02 — Eligibility and authorization
- Objective: enforce account-scoped Admin permissions and self-service exclusions.
- Dependency: WP-01.
- Exit: role and exclusion tests pass; Billing Owner gate cannot be bypassed.

## WP-03 — Price and discount preview
- Objective: return authoritative price, discount impact, effective date and next charge.
- Dependencies: WP-01 and WP-02.
- Exit: preview contract and stale-quote tests pass.

## WP-04 — Idempotent command model
- Objective: prevent repeated commands/events from duplicating state transitions or charges.
- Dependency: WP-01 and confirmed provider contracts.
- Exit: duplicate, concurrency, timeout and replay tests pass.

## WP-05 — Immediate upgrade
- Objective: coordinate Billing Owner approval, payment and immediate transition.
- Dependencies: WP-02, WP-03 and WP-04.
- Exit: payment failure preserves current state; success has correlated evidence.

## WP-06 — Scheduled changes
- Objective: implement downgrade and billing-cycle changes at next cycle.
- Dependencies: WP-02, WP-03 and WP-04.
- Exit: scheduled/effective state and entitlement timing tests pass.

## WP-07 — Cancel, pause, resume, reactivate
- Objective: implement remaining approved lifecycle operations.
- Dependencies: WP-02, WP-03 and WP-04.
- Exit: eligibility, date, price and transition tests pass.

## WP-08 — Entitlements and reconciliation
- Objective: handle eventual consistency and repair divergence safely.
- Dependencies: WP-05 to WP-07.
- Exit: failure-injection and reconciliation tests pass.

## WP-09 — Audit, notifications and analytics
- Objective: create traceable audit and outcome signals.
- Dependencies: WP-05 to WP-08.
- Exit: event contracts and audit completeness tests pass.

## WP-10 — Independent verification
- Objective: assess requirement compliance and security independently.
- Dependencies: WP-02 to WP-09.
- Exit: mandatory gates pass; critical findings closed.

## WP-11 — Progressive release
- Objective: release behind flags with canary observation and recovery.
- Dependency: WP-10 and human release approval.
- Exit: rollout thresholds met and recovery tested.

If a dependency or business rule is unknown, mark the package BLOCKED and request clarification.