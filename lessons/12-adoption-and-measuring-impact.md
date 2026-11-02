# Lesson 12 — End-to-End Implementation: Subscription Upgrade

[Course home](../README.md) · [Previous: Lesson 11](11-human-in-the-loop-and-safety.md) · Lesson 12 of 12

## Capstone
Bring the course together: take a fictional business request through discovery, specification, context preparation, agent roles, workflow orchestration, implementation, testing, review, approvals, and outcome measurement.

This is a training exercise. Use synthetic data and an isolated learning environment.

## Learning outcomes
- Explain the workflow from business intent to measured outcome.
- Organize repository context and artifacts.
- Define agent roles, states, and handoffs.
- Identify human decisions and quality checks.
- Produce a delivery package and Definition of Done.

## 1. Business request
A stakeholder asks: “Allow customers to upgrade their subscription plan.”

Clarify which plans are eligible, when an upgrade takes effect, how billing is handled, what happens when payment fails, how entitlements change, whether requests can be repeated, and who may request the change. Agents can organize questions; the product/domain owner must answer them.

## 2. Prepare context
1. Read repository instructions.
2. Inspect architecture and existing patterns.
3. Identify domain entities and API contracts.
4. Link the approved specification.
5. Confirm available commands and tests.
6. Define the task scope and permitted tools.

See [Example CLAUDE.md](../examples/agent-skills/CLAUDE.md).

## 3. Define agent roles
- Specification assistant: identify ambiguity and draft scenarios.
- Planning assistant: inspect code and propose implementation/test steps.
- Implementation agent: make the approved, bounded change.
- Test assistant: identify coverage gaps.
- Review assistant: inspect the diff independently.

These can be separate agents or separate tasks for one agent. Role boundaries matter more than agent count.

## 4. Workflow states
`Request Received → Clarification → Specification Draft → Product Approved → Planned → Implementing → Verification → Human Review → Approved → Released → Measured`

Exception states can include `Blocked: Business Decision`, `Verification Failed`, and `Changes Requested`. Never skip a required approval state.

## 5. Execute the vertical slice
1. Confirm scope and exclusions.
2. Produce an implementation plan.
3. Review and approve the bounded task.
4. Implement a small vertical slice.
5. Add tests for valid, invalid, access-control, and failure scenarios.
6. Run deterministic checks.
7. Generate a review report.
8. Resolve findings.
9. Obtain human approval before release.

Use the [sample plan-change specification](../examples/spec-templates/sample-plan-change-spec.md) as a starting point. Keep it marked as a draft until domain decisions are made.

## 6. Quality and governance
Use the [test strategy](../examples/quality-gates/test-strategy.md), [AI review checklist](../examples/quality-gates/ai-review-checklist.md), [quality gate script](../examples/quality-gates/quality-gate.sh), and [human approval policy](../examples/quality-gates/human-approval-policy.md).

A workflow is not complete just because code was generated. It must produce evidence that the change meets requirements and respects constraints.

## 7. Measure the outcome
Define a baseline and compare task cycle time, rework, acceptance rate, failed-change rate, recovery time, cost per accepted outcome, and repeatability. Use the [adoption playbook](../examples/adoption/adoption-playbook.md). Do not claim improvement without comparable baseline data.

## Capstone Definition of Done
- [ ] Business request and user value documented.
- [ ] Open business questions resolved by the appropriate owner.
- [ ] Scope and exclusions approved.
- [ ] Acceptance criteria testable and traceable.
- [ ] Repository context and agent permissions appropriate.
- [ ] Agent roles and handoffs explicit.
- [ ] Implementation stays within approved scope.
- [ ] Required tests and checks passed.
- [ ] Review findings resolved or explicitly accepted.
- [ ] Human approval recorded before release.
- [ ] Recovery and monitoring considerations documented.
- [ ] Outcome metrics and baseline captured.

## Artifacts
- [Subscription Platform case study](../examples/subscription-platform/README.md)
- [Feature specification template](../examples/spec-templates/feature-spec.md)
- [Sample plan-change specification](../examples/spec-templates/sample-plan-change-spec.md)
- [Agent contract](../examples/agent-architecture/agent-contract.md)
- [Repository instructions](../examples/agent-skills/CLAUDE.md)
- [Test design skill](../examples/agent-skills/skills/test-design/SKILL.md)
- [Prepare PR command](../examples/agent-skills/commands/prepare-pr.md)
- [Validation hook](../examples/agent-skills/hooks/validate-change.sh)
- [Feature delivery workflow](../examples/workflows/feature-delivery-workflow.md)
- [Risk-based test strategy](../examples/quality-gates/test-strategy.md)
- [AI review checklist](../examples/quality-gates/ai-review-checklist.md)
- [Quality gate script](../examples/quality-gates/quality-gate.sh)
- [Human approval policy](../examples/quality-gates/human-approval-policy.md)
- [Evaluation methodology](../examples/evaluation/README.md)
- [Evaluation rubric](../examples/evaluation/agent-evaluation-rubric.md)
- [Sample evaluation cases](../examples/evaluation/cases.json)
- [Adoption playbook](../examples/adoption/adoption-playbook.md)
- [Workflow maturity assessment](../assessments/workflow-maturity-assessment.md)

## Knowledge check — 10 questions
1. What is the first step after receiving the request?
   - A. Generate code immediately
   - B. Clarify the problem, scope, and missing business decisions
   - C. Release a prototype
   - D. Let the agent choose billing rules
2. Who approves rules such as proration and effective date?
   - A. Implementation agent
   - B. Product/domain owner
   - C. Test runner
   - D. Review model
3. Why prepare repository context?
   - A. Give the agent architecture, conventions, and commands
   - B. Remove the need for a specification
   - C. Grant access to live systems
   - D. Avoid reading code
4. Why separate agent roles?
   - A. Maximize agent count
   - B. Clarify responsibilities, outputs, and independent checks
   - C. Remove handoffs
   - D. Avoid human decisions
5. Which state should block work when a key business rule is unresolved?
   - A. Released
   - B. Blocked: Business Decision
   - C. Approved
   - D. Measured
6. What is a vertical slice?
   - A. A small end-to-end piece of the capability
   - B. A full platform rewrite
   - C. A documentation theme
   - D. A data deletion
7. Which combination gives stronger verification?
   - A. Agent confidence only
   - B. Tests, automated checks, diff review, and human judgment
   - C. A long prompt
   - D. Compilation only
8. When can a change be released?
   - A. When the agent says done
   - B. After required checks and authorized human approval
   - C. Before tests
   - D. When an average score is high regardless of safety
9. Why capture baseline metrics?
   - A. Compare delivery and quality before and after
   - B. Prove success in advance
   - C. Avoid measuring cost
   - D. Rank engineers
10. What is the strongest Definition of Done?
   - A. Code generated
   - B. Code committed
   - C. Requirements, verification, review, approval, readiness, and measurement addressed
   - D. Agent has no suggestions

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — Clarification prevents building the wrong behavior.
2. **B** — Domain decisions require accountable product ownership.
3. **A** — Context makes implementation project-aware.
4. **B** — Role boundaries improve clarity and independent verification.
5. **B** — The workflow should stop visibly for missing decisions.
6. **A** — A vertical slice delivers a narrow capability end to end.
7. **B** — Multiple forms of evidence reduce reliance on model confidence.
8. **B** — Release authority remains governed by policy and human approval.
9. **A** — A baseline enables meaningful comparison.
10. **C** — Completion includes quality, accountability, and operational readiness.
</details>

## Course complete
Apply the principles to a real workflow, start with a narrow pilot, measure the outcome, and improve the system from evidence.

[Return to course home](../README.md)
