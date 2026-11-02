# Acceptance Criteria — Subscription Management

## AC-01 Immediate upgrade succeeds
Given an eligible active subscription and Admin, with Billing Owner approval when a charge is due, when the user confirms and payment succeeds, then the subscription and entitlements move to the target plan, the operation is audited and confirmation is sent.

## AC-02 Upgrade payment fails
Given an eligible subscription, when payment is declined, then current plan and entitlements remain unchanged and retry does not duplicate a charge.

## AC-03 Downgrade scheduled
Given usage within target-plan limits, when Admin confirms downgrade, then a scheduled change is stored for next billing cycle and current entitlements remain effective until then.

## AC-04 Downgrade exceeds limits
Given usage exceeds a target limit, when downgrade is requested, then confirmation is blocked, limits are explained and no data is deleted.

## AC-05 Billing-cycle change
Given an eligible subscription, when cycle change is requested, then new price and effective date are displayed and the change is scheduled next cycle after confirmation.

## AC-06 Cancel renewal
Given an active paid subscription, when authorized Admin confirms cancellation, then renewal is disabled and access remains until paid-through date.

## AC-07 Discount incompatibility
Given a discount is not eligible for target plan, when preview is displayed, then discount loss and resulting price are disclosed before confirmation.

## AC-08 Role separation
Given Admin is not Billing Owner, when immediate-charge upgrade is requested, then it waits for Billing Owner approval and no payment is captured before approval.

## AC-09 Duplicate command or webhook
Given a confirmed operation and idempotency key, when command or provider event is delivered repeatedly, then operation is applied once and duplicate returns existing result.

## AC-10 Entitlement divergence
Given payment and subscription transition succeed but entitlement update fails, then workflow is not complete, reconciliation is created and critical rollout promotion is blocked.