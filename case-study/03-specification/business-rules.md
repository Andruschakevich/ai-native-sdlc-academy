# Business Rules — Subscription Management

| ID | Rule |
|---|---|
| BR-01 | Only authenticated account Admin may initiate eligible management operations. |
| BR-02 | Billing Owner approval is required for immediate financial charges and payment-method changes. |
| BR-03 | Upgrade is effective immediately only after required confirmation and successful payment. |
| BR-04 | Downgrade takes effect at the next billing cycle. |
| BR-05 | Monthly-to-annual and annual-to-monthly changes take effect next cycle. |
| BR-06 | Cancel stops renewal; access remains through paid-through date. |
| BR-07 | Pause is 1–3 months and only on eligible plans. |
| BR-08 | Resume discloses next charge and date before confirmation. |
| BR-09 | Reactivation requires eligible plan, displayed price and explicit confirmation. |
| BR-10 | Discount retained only if Promotion policy confirms compatibility and validity. |
| BR-11 | If discount is not retained, new price is displayed before confirmation. |
| BR-12 | Enterprise negotiated pricing and bespoke legacy terms are not self-service eligible. |
| BR-13 | Accounts with active dispute or overdue balance are ineligible until resolved. |
| BR-14 | Downgrade blocked if usage exceeds target limits; no data is deleted. |
| BR-15 | Logical operation is idempotent; duplicate requests/events do not duplicate effects. |
| BR-16 | Payment failure leaves existing effective subscription and entitlements unchanged. |
| BR-17 | Scheduled change does not update current entitlements before effective time. |
| BR-18 | Every transition records actor, timestamp, correlation ID and before/after state. |
| BR-19 | Divergent payment/subscription/entitlement state creates reconciliation; no blind financial retry. |
| BR-20 | Policy changes require accountable owner and downstream impact review. |

These are fictional training rules. Replace them with approved product policy in a real system.