# Risk Classification for AI Workflows

Risk is assigned per action/work package, not globally per feature. Consider impact, likelihood, reversibility, data sensitivity, external side effects and detectability.

| Class | Examples | Minimum controls | Autonomy guidance |
|---|---|---|---|
| Low | Documentation, isolated UI copy, formatting | Diff review, lint, basic CI | Bounded autonomous execution may be appropriate |
| Medium | New API behavior, non-financial domain logic | Unit, contract, integration tests; independent review | Autonomous implementation, gated merge |
| High | Billing, identity, subscription state, entitlements | Full relevant suite, security review, audit, failure injection, owner approval | Bounded implementation; human approval for merge/release |
| Critical | Production data mutation, financial compensation, destructive migration | Explicit plan, independent validation, rollback/recovery, accountable authorization | No autonomous execution by default |

## Escalation rules
- Increase risk when scope expands or new data/system boundaries appear.
- Unknown provider behavior or ownership is a blocker, not a low-risk assumption.
- A high-severity finding blocks progression.
- Risk acceptance must identify owner, scope, expiry and compensating controls.
- Reassess risk after implementation diff, not only at task creation.

This is an academy policy example, not a compliance certification or universal standard.
