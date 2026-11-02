# 10 — Quality Gates and Evaluation

## Learning objectives

- Define quality gates that are deterministic where possible.
- Evaluate agent workflows using representative tasks.
- Track reliability, cost, and usefulness over time.

## Three complementary layers

1. **Deterministic gates:** tests, lint, type checks, policy checks, secret scanning.
2. **Model-based evaluation:** rubric-based assessment of completeness, correctness, and instruction adherence.
3. **Human review:** domain judgment, risk acceptance, and approval.

A model score must not replace a deterministic control when the requirement can be checked directly.

## Evaluation dataset

Build a small, versioned set of representative tasks with:

- Input request and relevant context
- Expected behavior and prohibited behavior
- Acceptance criteria
- Known edge cases
- Evaluation rubric
- Expected artifacts

Run the same cases after changing prompts, models, tools, or workflow steps. Track regressions as well as improvements.

## Practical exercise

Use the [evaluation rubric](../examples/evaluation/agent-evaluation-rubric.md) and [sample cases](../examples/evaluation/cases.json) to score a workflow. Add one negative case and one ambiguous case.

## Expected outcome

A repeatable evaluation set, transparent scoring rubric, and documented release threshold.

## Related artifacts

- [Quality gate example](../examples/quality-gates/quality-gate.sh)
- [Evaluation methodology](../examples/evaluation/README.md)
