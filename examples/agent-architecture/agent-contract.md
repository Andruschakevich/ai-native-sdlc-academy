# Agent Contract Template

## Identity
Name:
Owner:
Version:

## Purpose
One sentence describing the outcome this agent owns.

## Inputs
- Required user request:
- Required repository context:
- Approved specification:
- Other dependencies:

## Permitted tools and actions
List read, write, and execute capabilities separately. Prefer least privilege.

## Outputs
- Required artifacts:
- Required summary:
- Evidence to include:

## Constraints
- Must:
- Must not:
- Assumptions prohibited:

## Stop and escalate when
- Requirements conflict or are ambiguous.
- A requested action exceeds the permitted scope.
- Sensitive data or credentials are encountered.
- A test or validation fails and the cause is unclear.
- A destructive, external, or production-impacting action is requested.

## Verification
Describe deterministic checks and human review required before the output is accepted.

## Handoff
Who receives the result? What exact information must be passed forward?
