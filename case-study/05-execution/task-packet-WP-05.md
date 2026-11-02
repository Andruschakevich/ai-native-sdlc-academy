# Task Packet — WP-05 Immediate Upgrade

**Status:** READY FOR IMPLEMENTATION IN TRAINING ENVIRONMENT ONLY  
**Risk:** High (financial and entitlement state)  
**Owner:** Subscription Domain Engineering Owner  
**Agent role:** Implementation Agent  
**Approval:** Human approval required before merge and production release.

## 1. Objective
Implement the immediate upgrade workflow for eligible self-service subscriptions while preserving payment, subscription, discount, entitlement and audit invariants.

## 2. Versioned inputs
- [Business Intent](../01-intent/business-intent.md) v1.0
- [System Context](../02-discovery/system-context.md)
- [Domain Model](../02-discovery/domain-model.md)
- [Requirements](../03-specification/requirements.md): FR-01, FR-02, FR-03, FR-04, FR-10, FR-12, FR-13
- [Business Rules](../03-specification/business-rules.md): BR-01, BR-02, BR-03, BR-10, BR-11, BR-15, BR-16, BR-18, BR-19
- [Acceptance Criteria](../03-specification/acceptance-criteria.md): AC-01, AC-02, AC-03, AC-04, AC-05, AC-12, AC-13, AC-14, AC-15, AC-16, AC-17
- [ADR-001 Idempotency](../04-architecture/ADR-001-idempotency.md)
- Approved service/API contracts and repository discovery evidence (must be attached in a real implementation)

## 3. Scope
- Read current subscription and eligible actions.
- Validate account-scoped Admin role and Billing Owner approval.
- Obtain authoritative price/discount preview.
- Accept an idempotent upgrade command.
- Process payment using approved provider semantics.
- Transition subscription only after required approval and authoritative payment success.
- Update entitlements and reconcile divergence.
- Record audit/correlation events and return authoritative operation status.

## 4. Out of scope
- Enterprise, bespoke legacy, overdue and disputed subscriptions.
- Refunds or financial compensation.
- Pricing-policy changes.
- Downgrade, pause, cancel and reactivation implementation.
- Production deployment, production data access or destructive migration.
- Unrelated refactoring.

## 5. Invariants
1. No duplicate financial effect for the same logical operation.
2. No immediate activation before required approval and payment success.
3. Payment decline leaves existing effective plan and entitlements unchanged.
4. No silent discount loss.
5. No entitlement is granted for an unactivated plan.
6. Payment/subscription/entitlement divergence remains visible and creates reconciliation.
7. All decisions and transitions are auditable.
8. Uncertain provider outcome is reconciled before retry.

## 6. Acceptance and evidence
- AC-04: successful upgrade across payment, subscription and entitlement.
- AC-05: declined payment preserves current effective state.
- AC-13: Admin without Billing Owner approval cannot trigger immediate capture.
- AC-14: duplicate command/webhook has one logical effect.
- AC-15: entitlement failure blocks completion and creates reconciliation.
- AC-16: audit/correlation evidence is complete.
- AC-03/AC-12: preview accurately discloses price and discount impact.

## 7. Allowed actions
Read approved repository and docs; edit only assigned paths in isolated workspace; run approved local tests; create branch/commit/PR if configured. Shared contract changes require contract-owner approval.

## 8. Prohibited actions
No production credentials, production DB, real payment operations, production migrations, merge, deployment, refund, data deletion or policy changes.

## 9. Definition of Done
All scoped ACs have evidence; required tests pass; full diff reviewed; traceability updated; no open Critical/High findings; implementation report and handoff created. Agent status is IMPLEMENTED, not VERIFIED or APPROVED.

## 10. Stop conditions
Missing provider semantics, conflicting business rule, unclear state ownership, missing approval, unexpected file scope, secret exposure or failed critical invariant => BLOCKED / CLARIFICATION_REQUIRED and escalate to owner.
