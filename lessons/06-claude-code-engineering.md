# Lesson 06 — Claude Code Engineering

[Course home](../README.md) · [← Previous lesson](../lessons/05-architecture-planning.md) · Lesson 06 of 12

## Why this lesson matters

Claude Code is an execution environment, not the AI-native SDLC architecture itself. Configure it as a controlled engineering environment.

## Learning outcomes

- Explain the role of this stage in the end-to-end AI-native SDLC.
- Identify inputs, outputs, decision owners and exit criteria.
- Apply the principles to the Subscription Management case study.
- Recognize when an agent must stop, request clarification or provide evidence.

## Core concepts

CLAUDE.md is a concise repository contract and context index. Rules are scoped constraints. Skills encode repeatable workflows. Subagents isolate specialist work. Hooks perform deterministic lifecycle checks. MCP provides approved context and tool integrations. Permissions restrict actions. Avoid one huge instruction file and grant least privilege.

## How to apply it

Discovery is read-only. Implementation works only in an isolated workspace and assigned scope. Verification inspects the specification and diff independently. No agent receives production database or payment credentials. Instructions alone do not enforce security.

## Practical exercise

Inspect the example CLAUDE.md, settings, rules and agent contracts. Design a minimal setup for read-only discovery and bounded implementation. Identify which controls must be enforced outside prompts.

## Completed case-study artifacts

- [CLAUDE.md](../claude-code/CLAUDE.md)
- [settings.json](../claude-code/settings.json)
- [security.md](../claude-code/rules/security.md)
- [database.md](../claude-code/rules/database.md)
- [discovery-agent.md](../claude-code/agents/discovery-agent.md)
- [verification-agent.md](../claude-code/agents/verification-agent.md)
- [SKILL.md](../skills/implement-work-package/SKILL.md)

## Knowledge check — 10 questions

1. What best describes the purpose of this stage?
   - A. Create a traceable and controlled part of the delivery lifecycle
   - B. Generate code without context
   - C. Remove all human ownership
   - D. Optimize prompt length

2. Which input should be treated as authoritative?
   - A. An undocumented chat assumption
   - B. The approved, versioned upstream artifacts
   - C. The implementation agent summary
   - D. A model confidence score

3. What should happen when a critical decision is missing?
   - A. Guess and continue
   - B. Hide the uncertainty
   - C. Stop the dependent action and request clarification
   - D. Delete the requirement

4. What is the strongest completion evidence?
   - A. Agent says done
   - B. A large code diff
   - C. A high model score
   - D. Independent evidence tied to acceptance criteria

5. What enables bounded autonomy?
   - A. Explicit scope, permissions, gates and recovery
   - B. Unrestricted administrator access
   - C. A long system prompt only
   - D. Skipping audit

6. What should a reliable handoff include?
   - A. Only a status emoji
   - B. Inputs, decisions, state, outputs and evidence
   - C. Only the model name
   - D. Only a verbal summary

7. Which condition should block progression?
   - A. A short file name
   - B. A nonessential heading style
   - C. A failed mandatory invariant or approval gate
   - D. A completed task

8. How should metrics be interpreted?
   - A. Without a baseline
   - B. As proof of causation
   - C. As a substitute for ownership
   - D. With definitions, baseline, sample and context

9. Who owns consequential business decisions?
   - A. The accountable human decision owner
   - B. The coding agent
   - C. The test runner
   - D. The cheapest model

10. What should the practical output demonstrate?
   - A. Only tool usage
   - B. A completed artifact with reviewable evidence
   - C. A production change without approval
   - D. Unrestricted autonomy

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **A** — This stage exists to produce a controlled, traceable delivery outcome.
2. **B** — Approved artifacts are the source of truth.
3. **C** — Critical uncertainty must be escalated, not concealed.
4. **D** — Evidence must demonstrate the expected behavior.
5. **A** — Autonomy is safe only within enforced boundaries.
6. **B** — Handoffs need enough context to continue safely.
7. **C** — Mandatory controls cannot be bypassed.
8. **D** — Metrics require sound definitions and interpretation.
9. **A** — Agents may advise, but accountable owners decide.
10. **B** — The course emphasizes verifiable artifacts, not tool demonstrations.

</details>

## Completion criteria

- [ ] I can explain the stage and its boundaries.
- [ ] I inspected the linked source artifacts.
- [ ] I completed the practical exercise.
- [ ] I answered the knowledge check and reviewed explanations.
- [ ] I know which decisions require a human owner.

[Next lesson →](../lessons/07-agent-orchestration.md)