# 08 — AI-Powered Testing

## Learning objectives

- Use AI to improve test discovery and coverage.
- Distinguish generated tests from trustworthy evidence.
- Prioritize tests by risk and behavior.

## Good uses of AI

- Identify boundary cases from requirements.
- Draft unit, integration, and API test cases.
- Explain failing tests and suggest hypotheses.
- Detect gaps between acceptance criteria and existing tests.
- Generate test data that is synthetic and safe.

## Verification pyramid

| Layer | Purpose | Typical gate |
|---|---|---|
| Static checks | Fast structural feedback | Lint, type check, secret scan |
| Unit tests | Local behavior | Required unit suite |
| Integration tests | Component contracts | API/database integration suite |
| End-to-end tests | Critical user journeys | Selected smoke/regression paths |
| Exploratory testing | Unexpected interactions | Human review for high-risk changes |

AI-generated tests can encode the same misunderstanding as AI-generated implementation. Review assertions against the approved specification and include negative cases.

## Practical exercise

Use the [test plan](../examples/quality-gates/test-strategy.md) and sample specification to create tests for valid, invalid, and boundary plan-change requests.

## Expected outcome

A traceable test matrix with risk-based coverage and clear evidence.
