# 09 — AI Code Review

## Learning objectives

- Use AI review as an additional signal, not an approval authority.
- Focus review on correctness, security, reliability, and maintainability.
- Make findings actionable and evidence-based.

## Review workflow

1. Read the approved specification and relevant architecture context.
2. Inspect the complete diff, not only the agent's summary.
3. Run deterministic checks.
4. Ask an independent reviewer or review agent to look for defects.
5. Require each finding to include severity, file/line, rationale, and a suggested verification.
6. Validate findings; dismiss false positives with reasoning.
7. Keep merge approval with an authorized human.

## Review priorities

- Business logic and acceptance criteria
- Authorization and access control
- Input validation and data exposure
- Concurrency, retries, and idempotency
- Error handling and observability
- Performance and resource usage
- Test quality and maintainability

## Practical exercise

Apply the [AI review checklist](../examples/quality-gates/ai-review-checklist.md) to a sample change. Record confirmed defects separately from questions and stylistic suggestions.

## Expected outcome

A review report that helps a human make a better decision without hiding uncertainty.
