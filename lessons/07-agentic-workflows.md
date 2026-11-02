# 07 — Agentic Engineering Workflows

## Learning objectives

- Design a multi-step workflow with explicit handoffs.
- Keep each stage independently verifiable.
- Define stop conditions and recovery paths.

## Example workflow

1. **Intake:** summarize the request and identify missing information.
2. **Specification:** draft requirements and acceptance scenarios.
3. **Human checkpoint:** product owner approves scope and business rules.
4. **Planning:** identify files, dependencies, risks, and test approach.
5. **Implementation:** agent makes a bounded change.
6. **Verification:** run tests, lint, static checks, and targeted exploratory review.
7. **Review:** produce a concise diff summary and unresolved risks.
8. **Human checkpoint:** engineer approves the change and merge.
9. **Release:** follow the team's established deployment approval process.

## Design principles

- Make state and artifacts visible.
- Pass structured outputs between stages.
- Avoid asking multiple agents to edit the same files concurrently.
- Make retries idempotent where possible.
- Record why an agent stopped or escalated.
- Ensure a person can resume the workflow after failure.

## Practical exercise

Adapt the [feature delivery workflow](../examples/workflows/feature-delivery-workflow.md) to a small feature. Define inputs, outputs, owner, and stop conditions for each stage.

## Expected outcome

A workflow diagram or runbook that a teammate can follow and audit.
