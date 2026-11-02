# Approval Matrix

| Action | Agent may prepare | Autonomous execution | Human approval |
|---|---|---|---|
| Read approved repository files | Yes | Yes, read-only | No |
| Draft Business Intent | Yes | Draft only | Product Owner approves GO |
| Confirm business rules | Options only | No | Product/domain owner |
| Generate implementation plan | Yes | Within approved scope | Owner approves non-trivial plan |
| Modify isolated workspace | Yes | Assigned package only | Review before merge |
| Run approved CI checks | Yes | Yes | No |
| Merge protected branch | Prepare PR | No by default | Authorized reviewer |
| Immediate charge/payment capture | Prepare request | Only after policy authorization | Billing Owner / policy owner |
| Production deployment | Prepare release | Approved workflow only | Release approver |
| Stop canary on critical threshold | Yes | If pre-authorized | Notify after action |
| Production DB mutation | Prepare plan | No | Explicit owner and change process |
| Refund/compensation/mass repair | Prepare reconciliation | No | Finance/business owner |
| Delete production data | Prepare impact analysis | No | Explicit high-risk approval |

Human approval must be attributable, scoped, recorded and time-bounded where appropriate.