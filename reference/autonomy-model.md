# Autonomy Model — L0 to L5

This is a working model for the academy, not an external certification.

| Level | Behavior | Typical control |
|---|---|---|
| L0 — Manual | Human performs task without AI execution | Standard human process |
| L1 — Assisted | AI suggests or drafts; human performs actions | Human checks each output |
| L2 — Repeatable | Shared context and standardized tasks | Templates and review |
| L3 — Orchestrated | Connected stages, agents and explicit handoffs | Workflow state and gates |
| L4 — Bounded autonomy | Agents execute defined task classes without per-step approval | Enforced permissions, monitoring, escalation and recovery |
| L5 — Adaptive autonomy | System optimizes workflows within approved limits | Continuous evaluation and constrained adaptation |

## L4 design test
For every autonomous action specify objective/scope, environment/data class, tool permissions, preconditions, expected output/evidence, deterministic verification, stop/escalation conditions, recovery path and accountable owner. A long-running agent or multi-agent team is not automatically L4.