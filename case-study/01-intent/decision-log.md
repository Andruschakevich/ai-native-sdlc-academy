# Intent Decision Log

| ID | Decision | Rationale | Downstream impact |
|---|---|---|---|
| D-001 | Include upgrade, downgrade, cycle change, cancel, pause/resume and reactivate | Solve subscription-management dependency | Requirements and tests |
| D-002 | Admin manages settings; Billing Owner approves immediate financial consequences | Separate account administration from financial authority | Authorization and approval flow |
| D-003 | Upgrade effective immediately after successful required payment | Clear customer expectation | Payment and entitlement orchestration |
| D-004 | Downgrade and billing-cycle changes take effect next cycle | Preserve paid value | Scheduled-change state machine |
| D-005 | Cancel renewal but preserve access through paid-through date | Avoid unexpected access loss | Cancellation and entitlement rules |
| D-006 | Pause for 1–3 months only on eligible plans | Bound operational complexity | Eligibility rules |
| D-007 | Preserve compatible discounts; disclose incompatible discounts and resulting price | Avoid financial surprise | Promotion and preview behavior |
| D-008 | Block downgrade above target limits; never delete data | Prevent destructive side effects | Preconditions and UX |
| D-009 | Exclude enterprise negotiated, bespoke legacy, disputed and overdue accounts | Keep self-service within deterministic policy | Eligibility |
| D-010 | Metrics are hypotheses pending baseline validation | Avoid fabricated impact | Measurement plan |

These are fictional training assumptions. Reopen them if discovery evidence or accountable owners contradict them.