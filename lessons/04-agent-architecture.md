# 04 — Agent Architecture

## Learning objectives

- Define a clear responsibility for each agent.
- Design inputs, outputs, tools, and boundaries.
- Avoid unnecessary multi-agent complexity.

## Start with a contract, not an agent swarm

A useful agent contract answers:

- **Purpose:** what outcome is the agent responsible for?
- **Inputs:** what files, context, and user decisions are required?
- **Tools:** which read/write/execute capabilities are permitted?
- **Outputs:** what artifacts or evidence must be returned?
- **Constraints:** what must never be changed or assumed?
- **Escalation:** when must the agent stop and ask a human?
- **Verification:** how is the result checked?

Prefer one well-scoped agent before introducing multiple agents. Add specialization only when it improves separation of concerns, quality, or parallelism enough to justify coordination overhead.

## Practical exercise

Define a specification analyst agent and an implementation agent for the same feature. Ensure the implementation agent cannot silently change approved business requirements.

## Expected outcome

Two agent contracts with distinct responsibilities and explicit handoff criteria.

## Related artifacts

- [Agent contract template](../examples/agent-architecture/agent-contract.md)
- [Workflow orchestration example](../examples/workflows/feature-delivery-workflow.md)
