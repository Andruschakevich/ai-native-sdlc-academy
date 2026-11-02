# Lesson 03 — Choosing the First Workflow

[Course home](../README.md) · [Previous: Lesson 02](02-ai-assisted-vs-ai-native.md) · Lesson 03 of 12

## Purpose

The first AI-native pilot should be selected for learning and measurable value, not for novelty. A good pilot is frequent, bounded, verifiable, and reversible.

## Learning outcomes

- Select a workflow suitable for an initial pilot.
- Define scope, exclusions, baseline, and success criteria.
- Identify risks and the required human checkpoints.
- Avoid automating unresolved business decisions.

## 1. Choose a workflow with useful properties

Look for work that is:
- Repeated often enough to produce evidence
- Small enough to understand and review
- Supported by accessible context
- Verifiable through tests or objective checks
- Low enough risk to experiment safely
- Reversible if the result is wrong

Examples include preparing a pull request summary, generating test cases from an approved specification, or implementing a small isolated change. Avoid starting with production data operations or unreviewed production deployments.

## 2. Write a pilot charter

A pilot charter should state:
1. Problem and intended user/business value
2. Current process and baseline
3. In-scope and out-of-scope tasks
4. Agent responsibilities and allowed tools
5. Required inputs and outputs
6. Verification and approval steps
7. Success metrics and guardrails
8. Duration, owner, and review cadence

Do not define success as “the team used AI.” Define a change in delivery outcome, quality, rework, or cost.

## 3. Define stop conditions

The agent should stop when requirements conflict, a business rule is missing, the task exceeds its scope, a mandatory check fails, sensitive data appears, or an action would affect an external or production system without approval.

## Practical walkthrough

For the Subscription Platform, choose a narrow plan-upgrade request. Do not include payment processing, refunds, proration, or entitlement migration in the first pilot. Those topics require explicit domain decisions.

Use the [pilot workflow template](../examples/workflows/pilot-workflow-template.md) to write your charter.

## Artifacts

- [Pilot workflow template](../examples/workflows/pilot-workflow-template.md)
- [Subscription Platform scenario](../examples/subscription-platform/README.md)
- [Human approval policy](../examples/quality-gates/human-approval-policy.md)

## Knowledge check — 10 questions

1. Which pilot is generally the best starting point?
   - A. An irreversible production database migration
   - B. A frequent, bounded, verifiable task with low blast radius
   - C. A workflow with unknown requirements and no owner
   - D. An organization-wide autonomous release process

2. Why should a pilot define out-of-scope work?
   - A. To hide requirements
   - B. To prevent scope expansion and unsafe assumptions
   - C. To avoid documentation
   - D. To make the agent choose its own priorities

3. Which is a meaningful success criterion?
   - A. Number of prompts sent
   - B. Reduced cycle time while maintaining quality thresholds
   - C. Number of generated lines
   - D. Number of tools installed

4. What is a baseline?
   - A. A target chosen after the pilot
   - B. A measurement of the current process before the change
   - C. A list of model names
   - D. A code style guide

5. Why is reversibility useful in a pilot?
   - A. It makes failures impossible
   - B. It limits the cost and impact of an unsuccessful experiment
   - C. It eliminates review
   - D. It guarantees faster delivery

6. Which task is a safer initial candidate?
   - A. Automatically approving production releases
   - B. Drafting test cases from an approved specification
   - C. Deleting stale customer records
   - D. Changing authorization policy without review

7. When should an agent stop?
   - A. Whenever it encounters an unfamiliar variable
   - B. When scope is exceeded or a critical decision is unresolved
   - C. Only after exhausting its token budget
   - D. Never

8. Who should own business rules?
   - A. The language model
   - B. The responsible product or domain owner
   - C. The CI runner
   - D. The code formatter

9. What should a pilot charter include?
   - A. Only the model name
   - B. Problem, scope, roles, verification, metrics, and ownership
   - C. Only a timeline
   - D. Only a prompt

10. Why should cost be considered?
   - A. AI tools are always free
   - B. A faster workflow may still be uneconomical if its total cost is too high
   - C. Cost matters only to procurement
   - D. It replaces quality metrics

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — A small and verifiable workflow creates a safe learning loop.
2. **B** — Boundaries make the experiment measurable and controlled.
3. **B** — Outcomes should balance speed and quality.
4. **B** — Without a baseline, improvement is hard to substantiate.
5. **B** — Reversibility reduces downside.
6. **B** — The source requirements are approved and output can be reviewed.
7. **B** — Stop conditions protect against unauthorized assumptions or actions.
8. **B** — Business intent requires accountable domain ownership.
9. **B** — The charter makes the experiment explicit.
10. **B** — Efficiency includes cost per accepted outcome.
</details>

**Next:** [Lesson 04 — Preparing the Repository and Agent Context](04-agent-architecture.md)
