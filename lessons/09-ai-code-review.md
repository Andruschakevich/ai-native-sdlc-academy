# Lesson 09 — Testing and Verification

[Course home](../README.md) · [Previous: Lesson 08](08-ai-powered-testing.md) · Lesson 09 of 12

## Purpose
AI can help discover test cases, draft test code, and explain failures. Generated tests are not automatically trustworthy. Verification must be tied to the approved specification and use independent evidence.

## Learning outcomes
- Derive test cases from requirements and risk.
- Combine automated checks with human review.
- Understand limitations of AI-generated tests.
- Report verification evidence clearly.

## 1. Start from requirements
For each acceptance criterion, identify happy paths, invalid input, boundaries, access rules, dependency failures, and retry behavior. Do not test business behavior that has not been decided.

## 2. Choose the test layer
- Static checks: formatting, lint, types, secret scanning.
- Unit tests: isolated business logic.
- Integration tests: contracts between components and persistence.
- End-to-end tests: critical user journeys.
- Exploratory testing: unexpected behavior and usability.

## 3. AI-generated tests
AI can propose edge cases and draft tests. A human must validate assertions against the approved spec. A test that mirrors an implementation's mistaken assumption can pass while the feature is wrong.

## 4. Verification report
For each check, report command, environment, result, and skipped checks. Separate passed, failed, blocked, and not-run. Never report a skipped test as passed.

## Practical exercise
Build a test matrix for plan upgrade using the [risk-based test strategy](../examples/quality-gates/test-strategy.md). Include valid and invalid requests, identity/access checks, persistence, and dependency failure. Mark unresolved business rules as blocked pending a decision.

## Artifacts
- [Risk-based test strategy](../examples/quality-gates/test-strategy.md)
- [Test design skill](../examples/agent-skills/skills/test-design/SKILL.md)
- [Sample specification](../examples/spec-templates/sample-plan-change-spec.md)

## Knowledge check — 10 questions
1. What should drive test design?
   - A. Implementation alone
   - B. Approved requirements, acceptance criteria, and risk
   - C. Number of changed files
   - D. Random generation
2. Why are AI-generated tests not automatically trustworthy?
   - A. They may encode the same incorrect assumption as implementation
   - B. They never compile
   - C. They cannot contain assertions
   - D. They are always end-to-end
3. Which layer is useful for isolated business logic?
   - A. Unit tests
   - B. Production smoke test only
   - C. Release approval
   - D. Load balancer logs
4. Which scenario matters for subscription data?
   - A. Ensuring customers can access only their own records
   - B. Font selection
   - C. README spelling
   - D. Prompt count
5. What should a report say about a test that was not run?
   - A. Passed
   - B. Not run/skipped, with reason
   - C. Passed if expected to pass
   - D. Omit it
6. What is the purpose of static checks?
   - A. Catch deterministic issues quickly
   - B. Replace all integration tests
   - C. Decide product scope
   - D. Approve releases
7. When is exploratory testing valuable?
   - A. When human observation can reveal unexpected behavior
   - B. Only after all users leave
   - C. To replace automation
   - D. Never
8. What if expected behavior is not specified?
   - A. Encode a guess
   - B. Record ambiguity and seek a domain decision
   - C. Delete the requirement
   - D. Let the framework decide
9. What makes a test traceable?
   - A. A long name
   - B. Mapping to a requirement or acceptance criterion
   - C. A particular language
   - D. Slow execution
10. Which is the best verification report?
   - A. “Looks good”
   - B. Commands, environment, results, failures, and skipped checks
   - C. Screenshot only
   - D. Total test count only

<details>
<summary><strong>Answer key and explanations</strong></summary>

1. **B** — Tests prove specified behavior and address risk.
2. **A** — Independent review helps avoid shared misunderstandings.
3. **A** — Unit tests isolate small pieces of logic.
4. **A** — Access rules protect private customer information.
5. **B** — Skipped and passed are different states.
6. **A** — Static checks are fast and deterministic.
7. **A** — Human exploration can uncover unanticipated issues.
8. **B** — Tests must not invent business policy.
9. **B** — Mapping makes coverage visible.
10. **B** — Evidence supports a trustworthy decision.
</details>

**Next:** [Lesson 10 — Code Review, Quality Gates, and Evaluation](10-quality-gates-and-evaluation.md)
