# 01 — AI-Native Engineering

## Why this matters

AI-native engineering is not simply using a coding assistant. It is the deliberate redesign of engineering work so that people and AI agents collaborate across discovery, specification, implementation, verification, delivery, and learning.

The goal is not maximum automation. The goal is better flow, quality, and adaptability with clear accountability.

## Learning objectives

- Distinguish AI-assisted tasks from AI-native workflows.
- Identify lifecycle activities suitable for agent support.
- Define the role of engineers and engineering leaders in an AI-native system.

## Core concepts

An AI-native SDLC has five characteristics:

1. **Context by design:** agents receive relevant product, architecture, coding, and quality context.
2. **Explicit work contracts:** tasks have clear inputs, constraints, acceptance criteria, and outputs.
3. **Bounded autonomy:** agents can act within defined permissions and stop when uncertain.
4. **Continuous verification:** generated changes are checked through deterministic tests and independent review.
5. **Human accountability:** people own product decisions, risk acceptance, and production release approval.

## Lifecycle map

| Stage | Useful agent contribution | Human accountability |
|---|---|---|
| Discovery | Summarize feedback, identify unknowns | Priorities and customer commitments |
| Specification | Draft scenarios and acceptance criteria | Scope and business rules |
| Design | Explore options and trade-offs | Architecture decisions |
| Implementation | Generate and modify code | Design intent and correctness |
| Verification | Generate tests, analyze failures | Risk acceptance |
| Review | Detect defects and explain diffs | Merge decision |
| Release | Prepare notes and checklists | Production approval |
| Operations | Summarize signals and incidents | Incident command and remediation |

## Practical exercise

Using the [Subscription Platform scenario](../examples/subscription-platform/README.md), map one feature request across the lifecycle. For each stage, write:

- What context the agent needs
- What action it may take
- What evidence it must produce
- When it must stop and ask a person

## Expected outcome

A one-page AI-native SDLC capability map with explicit human decision points.

## Related artifacts

- [Agent contract](../examples/agent-architecture/agent-contract.md)
- [Human approval policy](../examples/quality-gates/human-approval-policy.md)
- [Adoption playbook](../examples/adoption/adoption-playbook.md)
