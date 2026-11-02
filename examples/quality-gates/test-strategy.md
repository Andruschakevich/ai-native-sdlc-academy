# Risk-Based Test Strategy

## Principles
- Derive tests from approved requirements.
- Cover positive, negative, boundary, authorization, and dependency-failure behavior.
- Prefer deterministic checks for mandatory requirements.
- Keep test data synthetic.
- Do not treat generated tests as proof until assertions are reviewed.

## Sample test matrix

| Area | Scenario | Expected evidence | Suggested layer |
|---|---|---|---|
| Validation | Unknown plan ID | Stable validation error | Unit/API |
| Authentication | Missing credentials | Unauthorized response | API |
| Authorization | Customer accesses another customer's subscription | Access denied, no data leak | API/integration |
| Persistence | Valid request | Request stored once | Integration |
| Idempotency | Same request retried | No duplicate operation where contract requires | Integration |
| Dependency failure | Storage unavailable | Safe error and observable failure | Integration |

Confirm product-specific semantics before implementation.
