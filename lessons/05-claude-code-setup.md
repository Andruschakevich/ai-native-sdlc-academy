# Lesson 05 — Spec-Driven Development in Practice

[Course home](../README.md) · [Previous: Lesson 04](04-agent-architecture.md) · Lesson 05 of 12

## Purpose
A business request is rarely precise enough to implement directly. Spec-Driven Development (SDD) makes intended behavior explicit and gives implementation and verification a shared contract.

## Learning outcomes
- Turn an ambiguous request into a structured specification.
- Separate confirmed business rules from assumptions.
- Write testable acceptance criteria.
- Trace requirements to verification.

## 1. Start with intent
“Allow customers to upgrade their subscription” leaves many questions unanswered. Does the upgrade take effect immediately? Is billing prorated? What if payment fails? What happens to entitlements? An agent can identify these questions and draft scenarios; it must not decide the business answers.

## 2. Structure the specification
Include problem and user value, scope and non-goals, actors and preconditions, functional requirements, acceptance scenarios, confirmed business rules and open questions, API/data considerations, non-functional requirements, failure behavior, rollout/rollback, and requirement-to-test traceability.

## 3. Make acceptance criteria testable
Use Given/When/Then where useful. Example: Given an authenticated customer and an available plan, when the customer submits a plan-change request, then the service records the request and returns its identifier. This does not define when the plan becomes active; that remains a business decision.

## 4. Specification workflow
1. Ask the agent to identify ambiguity.
2. Draft the specification and scenarios.
3. Resolve business questions with the product/domain owner.
4. Review edge cases and non-functional requirements.
5. Approve and version the specification.
6. Use it as input for planning, implementation, and tests.

## Practical exercise
Use the [feature specification template](../examples/spec-templates/feature-spec.md) to write a plan-upgrade specification. Compare it with the [sample plan-change spec](../examples/spec-templates/sample-plan-change-spec.md). Mark assumptions that need confirmation.

## Artifacts
- [Feature specification template](../examples/spec-templates/feature-spec.md)
- [Sample plan-change specification](../examples/spec-templates/sample-plan-change-spec.md)
- [Subscription Platform scenario](../examples/subscription-platform/README.md)

## Knowledge check — 10 questions
1. What is the main purpose of SDD?
   - A. Document after coding
   - B. Make intended behavior explicit and traceable before implementation
   - C. Let agents decide business rules
   - D. Avoid acceptance criteria
2. What should an agent do with an unclear billing rule?
   - A. Choose a common convention
   - B. Mark it as an open question for the domain owner
   - C. Implement a default
   - D. Omit billing tests
3. Which criterion is most testable?
   - A. The upgrade is intuitive
   - B. The system is modern
   - C. Given a valid authenticated request, when submitted, then a request ID is returned
   - D. The code is clean
4. What is a non-goal?
   - A. An explicitly excluded feature area
   - B. A required test
   - C. A production metric
   - D. An agent identity
5. Why include failure behavior?
   - A. Failures never happen
   - B. Expected behavior must be clear when inputs or dependencies fail
   - C. It replaces normal scenarios
   - D. It matters only after release
6. What should happen before implementation?
   - A. Guess all open questions
   - B. Approve scope and relevant business decisions
   - C. Merge code
   - D. Delete tests
7. What does traceability connect?
   - A. Names and salaries
   - B. Requirements, acceptance criteria, and verification
   - C. Models and vendors
   - D. Prompts and tokens
8. Why include non-functional requirements?
   - A. Decoration
   - B. Security, reliability, and performance affect acceptability
   - C. They replace functional behavior
   - D. They are always identical
9. Which is a useful agent task during specification?
   - A. Approve pricing
   - B. Identify ambiguity and propose edge cases
   - C. Accept compliance risk
   - D. Decide refunds
10. When should a specification change?
   - A. Never
   - B. When an approved decision or requirement changes, explicitly and traceably
   - C. Only after incidents
   - D. Whenever an agent prefers another design

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — The spec becomes a shared delivery contract.
2. **B** — Unknown business rules need an accountable decision.
3. **C** — It describes observable behavior.
4. **A** — Non-goals protect scope.
5. **B** — Failure paths are part of expected behavior.
6. **B** — Approved scope prevents implementation based on guesses.
7. **B** — Traceability makes coverage visible.
8. **B** — A feature can work functionally but fail security or reliability expectations.
9. **B** — Agents can surface ambiguity; people decide policy.
10. **B** — Specs evolve, but decisions must remain explicit.
</details>

**Next:** [Lesson 06 — Configuring Agent Capabilities](06-custom-skills-and-commands.md)
