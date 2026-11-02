# Logical API and Event Contracts — Training Reference

**Status:** illustrative contract proposal; not a real provider/service schema. Confirm names, types, versioning and ownership during actual Discovery.

## 1. Preview request
```json
{
  "accountId": "acct_demo_001",
  "subscriptionId": "sub_demo_001",
  "targetPlanId": "plan_pro_annual",
  "requestedOperation": "UPGRADE"
}
```

## 2. Preview response
```json
{
  "quoteId": "quote_demo_001",
  "currency": "EUR",
  "currentPlan": "BASIC_MONTHLY",
  "targetPlan": "PRO_ANNUAL",
  "effectiveAt": "2026-11-02T12:00:00Z",
  "nextCharge": {"amount": 48.00, "currency": "EUR", "at": "2026-11-02T12:00:00Z"},
  "discount": {"retained": false, "reason": "NOT_ELIGIBLE_FOR_TARGET_PLAN"},
  "requiresBillingOwnerApproval": true,
  "expiresAt": "2026-11-02T12:10:00Z"
}
```

## 3. Command request
```json
{
  "operationId": "op_demo_001",
  "idempotencyKey": "opaque-client-generated-key",
  "quoteId": "quote_demo_001",
  "expectedSubscriptionVersion": 12,
  "approvalReference": "approval_demo_001"
}
```

## 4. Operation response
```json
{
  "operationId": "op_demo_001",
  "status": "PAYMENT_PENDING",
  "subscriptionStatus": "ACTIVE",
  "effectivePlan": "BASIC_MONTHLY",
  "targetPlan": "PRO_ANNUAL",
  "nextAction": "POLL_OR_SUBSCRIBE_TO_OPERATION_STATUS"
}
```

## 5. Event envelope
```json
{
  "eventId": "evt_demo_001",
  "eventType": "PaymentOutcomeConfirmed",
  "occurredAt": "2026-11-02T12:01:00Z",
  "correlationId": "op_demo_001",
  "aggregateVersion": 13,
  "payload": {"paymentStatus": "SUCCEEDED"}
}
```

## Contract invariants
- Price and currency are authoritative and tied to a quote with expiry.
- The command references the quote the user confirmed.
- Reuse of an idempotency key with a different request fingerprint is rejected.
- Operation status is explicit; timeout does not imply failure.
- Event identity and aggregate version support deduplication/order checks.
- Never trust client-submitted amount as authoritative.
- Do not include payment credentials or sensitive personal data in logs.

## Compatibility and ownership
Subscription API owns command contract; Billing owns quote contract; Payment Adapter owns provider normalization; Entitlement owns effective access event contract. Shared contract changes require versioning and consumer/provider contract tests.
