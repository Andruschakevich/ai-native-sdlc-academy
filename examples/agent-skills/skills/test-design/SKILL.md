# Skill: Risk-Based Test Design

## When to use
Use this procedure when asked to design or review tests for a feature specification.

## Procedure
1. Extract each requirement and acceptance scenario.
2. Identify equivalence classes and boundary values.
3. Identify negative, authorization, and failure cases.
4. Consider retries, duplicate requests, and concurrency where relevant.
5. Map each test to a requirement.
6. Recommend the lowest practical test layer.
7. Mark assumptions and unresolved domain questions.

## Output format
| ID | Requirement | Scenario | Expected result | Test layer | Risk |
|---|---|---|---|---|---|

## Rules
- Do not invent business behavior.
- Prefer observable assertions over implementation details.
- Include negative cases.
- Avoid tests that merely repeat the implementation logic.
- Label assumptions that need product-owner confirmation.
