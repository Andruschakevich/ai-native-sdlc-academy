# Database and State Rules

- Inspect schema, migrations, ownership and access patterns before proposing changes.
- Never assume a database is the source of truth without evidence.
- Preserve migration compatibility using expand → migrate → contract where appropriate.
- Do not delete customer data to satisfy a lower plan limit.
- Use transactions within a service boundary; do not assume distributed ACID transactions.
- Design retries, uniqueness and idempotency explicitly.
- Include rollback, roll-forward and reconciliation considerations.