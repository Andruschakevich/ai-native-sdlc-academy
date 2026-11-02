# Implementation Plan

| WP | Objective | Dependencies | Exit criteria |
|---|---|---|---|
| WP-01 | Confirm service contracts, roles and sources of truth | Discovery | Evidence-backed context approved |
| WP-02 | Eligibility and authorization | WP-01 | Role and exclusion tests pass |
| WP-03 | Price and discount preview | WP-01, WP-02 | Preview contract and stale-quote tests pass |
| WP-04 | Idempotent command model | WP-01 | Retry, duplicate and concurrency tests pass |
| WP-05 | Immediate upgrade payment workflow | WP-02, WP-03, WP-04 | Payment failure preserves current state |
| WP-06 | Scheduled downgrade and cycle change | WP-02, WP-03, WP-04 | Effective-date and scheduler tests pass |
| WP-07 | Cancel, pause, resume and reactivate | WP-02, WP-03, WP-04 | Eligibility and transition tests pass |
| WP-08 | Entitlement updates and reconciliation | WP-05–WP-07 | Failure-injection and reconciliation evidence |
| WP-09 | Audit, notification and analytics | WP-05–WP-08 | Event and audit tests pass |
| WP-10 | Independent quality/security verification | WP-02–WP-09 | Mandatory gates pass; critical findings closed |
| WP-11 | Progressive release and observation | WP-10 | Canary thresholds met and recovery tested |

Packages are bounded and independently verifiable. If a dependency or business rule is unknown, mark the package BLOCKED and request clarification.