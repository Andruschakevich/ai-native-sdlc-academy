# Subscription Platform — Learning Scenario

This fictional service manages customer subscriptions and plan changes. It exists only to provide a consistent, safe scenario for the academy.

## Domain

A customer can:
- View their current subscription
- Request a plan change
- See when a change takes effect
- Receive a confirmation

The exercise intentionally leaves business rules such as proration, refunds, cancellation windows, and entitlement transitions unspecified. Learners must identify these as questions rather than invent answers.

## Example feature request

"As a customer, I want to change my subscription plan so that I can choose the option that better fits my needs."

This request is intentionally incomplete. Use it to practice clarification and specification.

## Suggested workflow

1. Identify missing business decisions.
2. Draft acceptance criteria.
3. Agree on API and data changes.
4. Generate an implementation plan.
5. Implement a small, bounded change.
6. Add tests for positive, negative, and boundary cases.
7. Review the diff and evidence.
8. Obtain human approval before merge or release.

## Guardrails

- Use synthetic customer identifiers and data.
- Do not assume pricing, refund, or entitlement policies.
- Do not connect to real payment systems.
- Do not deploy to production as part of the exercise.
