# Lesson 02 — Understanding the AI-Native SDLC

[Course home](../README.md) · [Previous: Lesson 01](01-ai-native-engineering.md) · Lesson 02 of 12

## Purpose

Before configuring agents, map the current delivery system. Otherwise teams risk automating a broken process, optimizing one step while making another slower, or confusing tool usage with business value.

## Learning outcomes

- Map the main SDLC stages and their inputs/outputs.
- Identify friction, handoffs, and repeated work.
- Distinguish task automation from workflow orchestration.
- Describe autonomy as a capability with explicit boundaries.

## 1. Map the work, not the org chart

A practical lifecycle map may include discovery, requirements, design, planning, implementation, testing, review, release, operations, and learning. Real teams may combine or rename stages. The goal is to make work visible.

For each stage, record:
- Trigger and input
- Responsible role
- Activity and tools
- Output or artifact
- Handoff to the next stage
- Wait time, rework, and common failure modes
- Decision or approval required

Look for queues and repeated clarification. A coding agent cannot fix a product decision that arrives late or an environment that takes days to provision.

## 2. AI contribution by stage

| Stage | Possible agent contribution | Human responsibility |
|---|---|---|
| Discovery | Summarize feedback, cluster themes | Validate customer meaning and priority |
| Requirements | Draft scenarios, identify ambiguity | Confirm business rules and scope |
| Design | Explore options and trade-offs | Own architecture decisions |
| Implementation | Make bounded code changes | Review design and correctness |
| Testing | Suggest cases and analyze failures | Validate coverage and risk |
| Review | Find suspicious patterns in diffs | Decide whether findings are valid |
| Release | Prepare notes and checklists | Approve release |
| Operations | Summarize alerts and incidents | Lead incident response |

## 3. A maturity model for discussion

Use this simple model to identify the next improvement; it is not an industry certification.

- **0 — Ad hoc:** isolated experiments, inconsistent practices.
- **1 — Assisted:** individuals use AI for discrete tasks.
- **2 — Repeatable:** shared context, templates, and team conventions.
- **3 — Orchestrated:** connected steps, structured handoffs, and verification.
- **4 — Bounded autonomy:** agents execute well-defined work within enforced permissions, monitoring, and escalation.

A team can be mature in one workflow and immature in another. Score workflows, not people.

## 4. Baseline before optimization

Collect baseline data before a pilot. Examples include task cycle time, waiting time, rework, change failure rate, escaped defects, deployment frequency, and recovery time. Define each metric precisely and record the sample size.

## Practical exercise

Map one real workflow from request to production. Mark the longest wait, most frequent rework, and one low-risk task that could be improved with agent support. Complete the [workflow maturity assessment](../assessments/workflow-maturity-assessment.md).

## Artifacts

- [Workflow maturity assessment](../assessments/workflow-maturity-assessment.md)
- [Pilot workflow template](../examples/workflows/pilot-workflow-template.md)
- [Adoption playbook](../examples/adoption/adoption-playbook.md)

## Knowledge check — 10 questions

1. Why map the current SDLC before introducing agents?
   - A. To automate every stage immediately
   - B. To identify friction, dependencies, and baseline performance
   - C. To replace team responsibilities
   - D. To select a model based on popularity

2. What should a useful stage map include?
   - A. Only the tools used
   - B. Inputs, outputs, owners, handoffs, waits, and decisions
   - C. Only job titles
   - D. Only code repositories

3. Which is an example of an agent contribution in discovery?
   - A. Approving company strategy
   - B. Summarizing feedback themes for human validation
   - C. Accepting legal risk
   - D. Committing product budget

4. What does maturity level 3 represent in this course model?
   - A. No AI usage
   - B. Individual prompts
   - C. Orchestrated steps with structured handoffs and verification
   - D. Fully autonomous organization

5. Why is maturity scored per workflow?
   - A. Every team has identical processes
   - B. Capability can differ significantly between workflows
   - C. It makes scores larger
   - D. It removes the need for baseline metrics

6. Which metric pair gives a more balanced view?
   - A. Prompt count and generated lines
   - B. Cycle time and change failure rate
   - C. Model size and token count only
   - D. Number of chat messages and meetings

7. What is a handoff?
   - A. A model upgrade
   - B. Transfer of an artifact or responsibility between stages or roles
   - C. A deployment rollback
   - D. A coding style

8. If implementation is fast but review waits for several days, what should be investigated?
   - A. Only the code-generation prompt
   - B. The downstream review queue and workflow bottleneck
   - C. Whether to remove all reviews
   - D. Whether to increase generated code volume

9. What does level 4 mean here?
   - A. Agents have unrestricted access
   - B. Bounded execution with permissions, monitoring, and escalation
   - C. No human ownership
   - D. All tasks use the same agent

10. Why define metrics before a pilot?
   - A. To guarantee a positive result
   - B. To compare outcomes against a known baseline
   - C. To avoid measuring quality
   - D. To prove AI is always faster

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — Understand the system before changing it.
2. **B** — A map needs the flow and decision points, not just tools.
3. **B** — Agents can summarize; people validate meaning and priorities.
4. **C** — Orchestration connects repeatable steps and checks.
5. **B** — A single organization can have different maturity levels across workflows.
6. **B** — Speed without quality can create misleading conclusions.
7. **B** — Handoffs move work and its context.
8. **B** — Optimizing one stage can expose another bottleneck.
9. **B** — Autonomy remains bounded and governed.
10. **B** — A baseline makes improvement measurable.
</details>

**Next:** [Lesson 03 — Choosing the First Workflow](03-spec-driven-development.md)
