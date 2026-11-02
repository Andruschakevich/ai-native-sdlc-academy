# 11 — Human-in-the-Loop and Safety

## Learning objectives

- Identify actions that require human approval.
- Apply least privilege and reversible execution.
- Define escalation paths for uncertainty and high-impact changes.

## Risk-based autonomy

| Risk | Example | Default control |
|---|---|---|
| Low | Read files, summarize code | Agent may proceed within scope |
| Medium | Modify local code, add tests | Diff review and automated checks |
| High | Change auth, migrations, dependencies | Explicit engineer approval |
| Critical | Production release, destructive data action, access policy change | Authorized human approval and established change process |

Risk depends on context. A seemingly small change can be high impact.

## Required safeguards

- Least-privilege tool access
- Explicit scope and allowed paths
- No secrets in prompts or logs
- Sandboxed execution where feasible
- Human approval for high-impact actions
- Audit trail for changes and decisions
- Rollback and incident response plan

## Practical exercise

Use the [human approval policy](../examples/quality-gates/human-approval-policy.md) to classify ten actions in your environment. Identify who can approve each one.

## Expected outcome

A risk-tiered autonomy policy and escalation matrix.
