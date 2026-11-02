# ADR-001: Idempotent Subscription Operations

- Status: Accepted for fictional training architecture
- Decision owner: Engineering and Billing domain owners

## Context
Retries, timeouts and duplicate or out-of-order provider webhooks can trigger duplicate charges or repeated state transitions.

## Decision
Each logical subscription command carries an idempotency key scoped to account and operation. Persist the key, request fingerprint, operation ID and result. Deduplicate provider events by provider event ID and correlate them to the operation. Validate current state and expected version before transition.

## Consequences
Repeated requests return the existing operation result. Reusing a key with a different payload is rejected. Retention must exceed retry and reconciliation windows. Uncertain provider outcomes require status reconciliation; never blindly retry a potentially captured charge.

## Alternatives
- UI button disabling is insufficient because it does not protect server retries.
- Provider-only idempotency does not cover internal state transitions and webhook deduplication.
- A global distributed lock is more complex and does not replace idempotent commands.

## Verification
Duplicate command, duplicate webhook, timeout-after-submit, concurrent update and reconciliation tests.