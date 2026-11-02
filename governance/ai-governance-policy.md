# AI Governance Policy — Training Reference

## Governance domains
1. Business governance — intent, value, priorities and decision ownership.
2. Engineering governance — architecture, standards, quality and change control.
3. AI governance — model selection, agent roles, tool changes, evaluation and cost.
4. Security/compliance — data classification, identity, permissions, secrets and audit.
5. Operational governance — deployment, observability, incidents, recovery and learning.

## Non-negotiable principles
- Least privilege and task-specific permissions.
- No agent self-approval for high-impact work.
- Independent verification for consequential changes.
- Deterministic enforcement for mandatory controls.
- Auditability of agent identity, model/tool version, actions, outputs and approvals.
- No secrets or unnecessary personal data in model context.
- Escalate ambiguity, policy conflict and scope expansion.
- Model confidence never overrides failed mandatory checks.

## Autonomy
Autonomy is assigned per action and environment, not globally. Discovery is read-only. Implementation is limited to isolated workspace and approved paths. Release actions use policy-controlled workflows. Production data mutation, financial compensation and destructive actions require explicit human approval.

## Model governance
Route simple tasks to lower-cost models when evaluation shows sufficient quality. Use stronger models for complex tasks only when evidence demonstrates value. Independence comes from separate context, evidence and verification, not necessarily another vendor. Version prompts, tools, models and evaluation datasets. Define fallback and stop on uncertainty.

## Enforcement
CLAUDE.md and prompts communicate rules but do not enforce security. Enforce through tool permissions, IAM, sandboxing, branch protection, CI/CD, secrets controls and policy checks at action boundaries.