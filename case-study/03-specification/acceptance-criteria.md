# Acceptance Criteria — Subscription Management

These criteria are the fictional training contract. They are derived from FR/BR and are not universal subscription policy.

## AC-01 — View current subscription
**Given** an authenticated Admin belongs to the account  
**When** the Admin opens subscription management  
**Then** the product shows authoritative plan, status, billing period and eligible actions for that account only.

## AC-02 — Eligibility exclusions
**Given** an account is enterprise-negotiated, bespoke legacy, overdue or has an active billing dispute  
**When** self-service eligibility is evaluated  
**Then** the operation is unavailable with a clear reason and no billing command is issued.

## AC-03 — Price and discount preview
**Given** an eligible target plan  
**When** the Admin requests a preview  
**Then** the system displays authoritative price, currency, effective date, next charge and discount impact.

## AC-04 — Successful immediate upgrade
**Given** an eligible active subscription and an authorized actor  
**And** Billing Owner approval exists when an immediate charge is required  
**When** the Admin confirms and payment succeeds  
**Then** the subscription transitions to the target plan, entitlements converge, the operation is audited and confirmation reflects authoritative state.

## AC-05 — Upgrade payment declined
**Given** an eligible subscription  
**When** the payment provider declines the upgrade payment  
**Then** the existing effective plan and entitlements remain unchanged and the failed operation is recorded.

## AC-06 — Downgrade scheduled
**Given** usage is within target-plan limits  
**When** an Admin confirms downgrade  
**Then** a scheduled change is stored for the next billing cycle and current entitlements remain effective until that date.

## AC-07 — Downgrade exceeds limits
**Given** current usage exceeds one or more target-plan limits  
**When** downgrade is requested  
**Then** the excess is explained, confirmation is blocked and no data is deleted.

## AC-08 — Billing-cycle change
**Given** an eligible subscription and available target billing cycle  
**When** an Admin confirms the cycle change  
**Then** the new price and effective date are disclosed and the change is scheduled for the next billing cycle.

## AC-09 — Cancel renewal
**Given** an active paid subscription  
**When** an authorized Admin confirms cancellation  
**Then** renewal is disabled and access remains until the paid-through date.

## AC-10 — Pause and resume
**Given** a plan supports pause and the requested duration is 1–3 months  
**When** the Admin confirms pause or resume  
**Then** the system records the allowed lifecycle transition, discloses the next charge/date where applicable and does not silently change the effective entitlement.

## AC-11 — Reactivate
**Given** a canceled subscription is eligible for reactivation and the plan is available  
**When** an authorized actor reviews the price and confirms  
**Then** reactivation follows the approved payment/approval flow and the resulting subscription and entitlements are consistent.

## AC-12 — Incompatible discount
**Given** a discount is not valid for the target plan  
**When** preview is displayed  
**Then** the discount loss and resulting price are disclosed before confirmation; no silent transfer occurs.

## AC-13 — Role separation
**Given** the Admin is not the Billing Owner  
**When** an immediate-charge operation is requested  
**Then** it waits for Billing Owner approval and no charge is captured before approval.

## AC-14 — Idempotent command and event
**Given** a logical operation has an idempotency key and provider events have unique identities  
**When** the same command or event is delivered repeatedly  
**Then** the logical operation is applied once and duplicate requests return the existing operation result.

## AC-15 — Entitlement divergence
**Given** payment and subscription transition succeed but entitlement update fails  
**When** the workflow detects divergence  
**Then** the operation remains incomplete, reconciliation is created and rollout promotion is blocked.

## AC-16 — Audit and correlation
**Given** any subscription-management operation is attempted  
**When** it is accepted, rejected or completed  
**Then** an audit record captures actor, account, action, timestamp, outcome, before/after state where applicable and correlation ID without secrets.

## AC-17 — Notification failure
**Given** a subscription transition is committed  
**When** notification delivery fails  
**Then** notification retry is isolated from the financial transition and does not duplicate the business operation.

## AC-18 — Analytics failure
**Given** a valid business transition occurs  
**When** analytics delivery is unavailable  
**Then** the event is retried/reconciled without blocking the financial transition or losing the measurement event.
