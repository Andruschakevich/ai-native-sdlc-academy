# AI-Assisted Code Review Checklist

## Correctness
- Does the change satisfy the approved specification?
- Are edge cases and failure paths handled?
- Are state transitions and invariants preserved?

## Security and privacy
- Is authorization enforced server-side?
- Can data belonging to another user be accessed?
- Are secrets, tokens, or personal data exposed in logs or errors?
- Is input validated at trust boundaries?

## Reliability
- Are retries safe?
- Are operations idempotent where required?
- Are timeouts and dependency failures handled?
- Is observability sufficient?

## Maintainability
- Is the change focused?
- Are abstractions consistent with the codebase?
- Are tests meaningful and stable?

## Finding format
- Severity:
- File and line:
- Evidence:
- Impact:
- Suggested verification:

Reviewers must validate findings. AI review is advisory and does not approve a merge.
