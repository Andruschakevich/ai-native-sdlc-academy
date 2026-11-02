# Lesson 07 — Designing the Agentic Workflow

[Course home](../README.md) · [Previous: Lesson 06](06-custom-skills-and-commands.md) · Lesson 07 of 12

## Purpose
A collection of prompts is not yet a workflow. A workflow defines stages, state, inputs, outputs, ownership, transitions, verification, and recovery.

## Learning outcomes
- Design a multi-step workflow around a feature.
- Define agent roles and handoffs.
- Add human checkpoints and stop conditions.
- Make execution observable and recoverable.

## 1. Define the stages
A feature workflow can include intake, specification, product approval, planning, implementation, verification, review, human merge/release approval, and learning. Each stage needs an owner, input, output, and stop condition.

## 2. Separate responsibilities
A specification assistant identifies ambiguity and drafts scenarios. A planning assistant inspects dependencies and proposes implementation/test steps. An implementation agent makes bounded changes. A test-focused agent reviews coverage. A review agent independently inspects the diff.

These may be separate agents or distinct tasks for one agent. Add roles only when separation improves quality or parallelism enough to justify coordination cost.

## 3. Structured handoffs
A useful handoff includes approved scope, relevant specification and context, files/components involved, work completed, checks and results, open questions, risks, and next action.

## 4. State and recovery
Possible states: Draft, Awaiting Product Decision, Approved, Planned, Implementing, Verification Failed, Ready for Review, Approved to Merge, Released. Preserve artifacts after failure; record evidence; never silently skip a mandatory gate.

## Practical exercise
Draw the Subscription Platform upgrade workflow. For every stage define owner, input, output, stop condition, and next state. Compare with the [reference workflow](../examples/workflows/feature-delivery-workflow.md).

## Artifacts
- [Feature delivery workflow](../examples/workflows/feature-delivery-workflow.md)
- [Agent contract template](../examples/agent-architecture/agent-contract.md)
- [Pilot workflow template](../examples/workflows/pilot-workflow-template.md)

## Knowledge check — 10 questions
1. What makes prompts into a workflow?
   - A. More prompts
   - B. Defined stages, state, inputs/outputs, handoffs, checks, and ownership
   - C. A longer system message
   - D. A vendor-specific model
2. Why define agent roles?
   - A. Maximize agent count
   - B. Clarify responsibilities and outputs
   - C. Remove human ownership
   - D. Avoid documentation
3. When should multiple agents be introduced?
   - A. Always
   - B. When separation improves quality or parallelism enough to justify coordination
   - C. For every multi-file task
   - D. Only for review
4. What should a handoff include?
   - A. “Done”
   - B. Scope, context, outputs, checks, risks, and next action
   - C. Hidden reasoning
   - D. Unrelated history
5. Why use explicit workflow states?
   - A. Make progress and transitions observable
   - B. Slow delivery
   - C. Replace source control
   - D. Avoid approvals
6. What should happen after a mandatory test fails?
   - A. Hide the failure
   - B. Record evidence and stop or recover according to policy
   - C. Mark released
   - D. Delete the test
7. Who should resolve business scope?
   - A. Formatter
   - B. Responsible product owner
   - C. Deployment script
   - D. Test runner
8. What is a good recovery strategy?
   - A. Restart blindly
   - B. Preserve artifacts, record failure, resume from a known state
   - C. Skip the failed stage
   - D. Change requirements without approval
9. Why include a human approval checkpoint?
   - A. Agent output is always useless
   - B. Some decisions require accountable judgment and risk acceptance
   - C. It is needed after every token
   - D. It prevents all defects
10. What is a risk of excessive agent specialization?
   - A. Lower coordination overhead
   - B. More handoffs and complexity without enough benefit
   - C. Guaranteed correctness
   - D. Better context automatically

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — A workflow defines how work moves and is controlled.
2. **B** — Clear roles reduce overlap and ambiguity.
3. **B** — Add complexity only when it produces value.
4. **B** — A handoff must be actionable and reviewable.
5. **A** — State makes execution visible and recoverable.
6. **B** — Mandatory gates cannot be silently bypassed.
7. **B** — Product decisions need domain ownership.
8. **B** — Preserve evidence and resume deliberately.
9. **B** — Accountability remains with people.
10. **B** — Coordination cost can outweigh specialization benefits.
</details>

**Next:** [Lesson 08 — AI-Assisted Implementation](08-ai-powered-testing.md)
