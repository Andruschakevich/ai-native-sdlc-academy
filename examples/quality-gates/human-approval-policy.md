# Human Approval Policy — Example

This is a starting point. Each organization must adapt it to its risk model and regulatory obligations.

| Action | Default autonomy | Required approval |
|---|---|---|
| Read repository files | Allowed within access policy | None |
| Draft documentation | Allowed | Review before publication |
| Modify local application code | Bounded | Engineer reviews diff |
| Add or update tests | Bounded | Engineer reviews assertions |
| Change authentication or authorization | Restricted | Security/engineering owner |
| Modify CI/CD or infrastructure | Restricted | Platform owner |
| Run destructive data operation | Prohibited by default | Explicit authorized approval and change plan |
| Deploy to production | Not delegated | Authorized release owner |

## Escalation triggers
- Ambiguous or conflicting requirements
- Sensitive data or secrets
- Unexpected access to external systems
- Unbounded or destructive operation
- Failed mandatory quality gate
- Potential security vulnerability
