# 03 — Spec-Driven Development

## Why specifications matter

Agents perform better when the intended outcome is explicit. Spec-Driven Development (SDD) treats the specification as a working contract that guides implementation and verification—not as documentation written after the fact.

## Learning objectives

- Convert an ambiguous request into testable requirements.
- Separate business intent, constraints, and implementation choices.
- Connect acceptance criteria to tests and review evidence.

## A useful specification contains

1. Problem and user value
2. Scope and non-goals
3. Actors and preconditions
4. Functional requirements
5. Acceptance scenarios
6. Data and API considerations
7. Security, privacy, and reliability constraints
8. Observability and rollout considerations
9. Open questions and decisions

## Workflow

1. Ask an agent to identify ambiguity and missing information.
2. Resolve product and domain questions with the responsible people.
3. Draft scenarios in Given/When/Then form.
4. Review edge cases, failure behavior, and non-functional requirements.
5. Link each acceptance criterion to a verification method.
6. Freeze the approved scope for implementation; update the spec when decisions change.

## Practical exercise

Use the [feature specification template](../examples/spec-templates/feature-spec.md) to specify a plan-change feature for the fictional Subscription Platform.

Do not let the agent invent pricing, cancellation, or entitlement rules. Record unknowns explicitly.

## Expected outcome

An approved feature specification with traceable acceptance criteria.

## Related artifacts

- [Subscription Platform scenario](../examples/subscription-platform/README.md)
- [Sample plan-change specification](../examples/spec-templates/sample-plan-change-spec.md)
