# Implementation Report — Training Example

**Work package:** WP-04 — Idempotent Command Model  
**Status:** READY_FOR_INDEPENDENT_REVIEW (illustrative report; not evidence of a real code change)

## Summary
The proposed command contract uses an idempotency key scoped to account and operation, a stable operation ID, request fingerprint and persisted result. Provider events are deduplicated by provider event ID and correlated to the operation.

## Requirements addressed
FR-12, NFR-03, BR-15 and ADR-001.

## Expected verification
- Repeating the same command returns existing operation.
- Reusing a key with different payload is rejected.
- Duplicate webhook does not reapply payment or state transition.
- Timeout after provider submission triggers status reconciliation, not blind retry.
- Concurrent updates detect stale expected version.

## Evidence limitation
No executable application code is included in this academy artifact. A real report must link actual commit, test run, CI run and environment evidence. This example demonstrates report structure only.

## Risks
Provider idempotency windows, event retention and reconciliation timing must be validated against selected provider and actual service contracts.