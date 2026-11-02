# Feature Delivery Workflow

## Purpose
A repeatable, bounded workflow for moving a small feature from request to human-reviewed change.

## Stages

| Stage | Owner | Input | Output | Stop condition |
|---|---|---|---|---|
| Intake | Product + agent | Request | Clarified problem and unknowns | Business decision missing |
| Specification | Product owner + agent | Clarified request | Approved spec | Scope not approved |
| Planning | Engineer + agent | Approved spec | File/test plan | Architecture risk unresolved |
| Implementation | Agent under engineer supervision | Plan and repo context | Focused code diff | Scope or permission exceeded |
| Verification | CI + engineer | Diff and spec | Test/check evidence | Required check fails |
| Review | Human reviewer, optional review agent | Diff and evidence | Review findings | Critical finding unresolved |
| Merge/release | Authorized human | Approved PR | Change record | Approval absent |

## Recovery
- Preserve the current diff and summarize completed work.
- Record the failing stage and evidence.
- Do not silently skip a failed gate.
- Retry only after the failure cause is understood.
- Escalate changed requirements to the product owner.
