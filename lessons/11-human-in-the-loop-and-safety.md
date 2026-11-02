# Lesson 11 — Governance, Human Oversight, and Adoption

[Course home](../README.md) · [Previous: Lesson 10](10-quality-gates-and-evaluation.md) · Lesson 11 of 12

## Purpose
AI-native workflows change how work is performed, but do not remove organizational accountability. Governance belongs inside the workflow: permissions, approvals, auditability, data handling, escalation, and outcome measurement.

## Learning outcomes
- Classify actions by risk and autonomy.
- Define approval and escalation boundaries.
- Apply minimum necessary access and safe data handling.
- Plan adoption and measure outcomes rather than activity.

## 1. Risk-based autonomy
- **Low risk:** read repository files, summarize code, draft documentation.
- **Medium risk:** modify local code, add tests, prepare a pull request; require diff review and checks.
- **High risk:** change access rules, infrastructure, migrations, or dependencies; require owner approval.
- **Critical risk:** release to live environments or destructive data operations; retain authorized human approval and established change processes.

Risk depends on system context. A small-looking change may have a large impact.

## 2. Core guardrails
- Minimum necessary tool and environment access
- Explicit scope and allowed paths
- No secrets or sensitive customer data in prompts or logs
- Isolated execution where practical
- Human approval for high-impact actions
- Audit trail for changes and decisions
- Recovery plans and clear escalation when uncertain

## 3. Adoption is change management
A sustainable rollout includes baseline measurement, a narrow pilot, clear guardrails, hands-on enablement, feedback channels, reusable patterns, champions, and regular review. Train reviewers as well as tool users.

## 4. Measure outcomes
Balance flow (cycle time, task-to-completion time), quality and stability (failed changes, escaped defects, recovery time), adoption (repeat use of validated workflows), and efficiency (rework and cost per accepted outcome).

Do not optimize for prompt count, generated lines, or raw usage.

## Practical exercise
Use the [human approval policy](../examples/quality-gates/human-approval-policy.md) to classify ten actions in your environment. Draft a 30/60/90-day rollout using the [adoption playbook](../examples/adoption/adoption-playbook.md). Assign an owner to each guardrail and metric.

## Artifacts
- [Human approval policy](../examples/quality-gates/human-approval-policy.md)
- [Adoption playbook](../examples/adoption/adoption-playbook.md)
- [Workflow maturity assessment](../assessments/workflow-maturity-assessment.md)
- [Evaluation rubric](../examples/evaluation/agent-evaluation-rubric.md)

## Knowledge check — 10 questions
1. What is the purpose of risk-based autonomy?
   - A. Give all agents identical permissions
   - B. Match autonomy and approvals to action impact
   - C. Remove all human decisions
   - D. Make every action critical
2. Which action normally requires strong human approval?
   - A. Reading source files
   - B. Drafting a summary
   - C. Releasing to a live environment
   - D. Formatting a local document
3. What does minimum necessary access mean?
   - A. Give only the access required for the task
   - B. Give every agent administrator access
   - C. Share a common privileged credential
   - D. Disable logs
4. Why are written instructions alone insufficient for access control?
   - A. Actual permissions and environment controls must enforce restrictions
   - B. Live systems cannot be secured
   - C. Agents cannot read instructions
   - D. Prompts are always too short
5. Which is a good escalation trigger?
   - A. A task is fully specified
   - B. Requirements conflict or the action exceeds permitted scope
   - C. A test passes
   - D. A README is updated
6. What should an adoption program include?
   - A. Tool installation only
   - B. Baseline, pilot, guardrails, enablement, feedback, and review
   - C. Mandate AI for every task
   - D. One launch email
7. Why train reviewers?
   - A. They need to assess AI-generated changes and evidence
   - B. Reviewers no longer matter
   - C. It increases prompt length
   - D. It removes testing
8. Which is a useful stability measure?
   - A. Prompt count
   - B. Rate of failed changes
   - C. Generated lines
   - D. Chat windows
9. What does cost per accepted outcome help explain?
   - A. Economic efficiency of useful delivered work
   - B. Number of employees
   - C. Model personality
   - D. Prompt volume
10. Why pair speed metrics with quality metrics?
   - A. Faster delivery can be harmful if defects and rework increase
   - B. Quality is unrelated to delivery
   - C. Speed must always decrease
   - D. It removes the need for measurement

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — Permissions should reflect risk and impact.
2. **C** — Live releases are high-impact actions.
3. **A** — Minimize access and potential impact.
4. **A** — Real controls must be enforced outside the model.
5. **B** — Ambiguity and scope violations require escalation.
6. **B** — Adoption requires operating-model changes, not just licenses.
7. **A** — Review quality is essential when AI contributes to changes.
8. **B** — Failed-change rate reflects stability.
9. **A** — It relates cost to useful accepted output.
10. **A** — Speed alone can hide quality degradation.
</details>

**Next:** [Lesson 12 — End-to-End Implementation: Subscription Upgrade](12-adoption-and-measuring-impact.md)
