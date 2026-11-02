# AI-Native SDLC Academy

> **A practical, self-paced training project about understanding, configuring, and applying AI-native software engineering workflows.**

This academy documents the approach I have learned, practiced, and currently apply in my engineering work. It is a learning project: the examples demonstrate my current understanding of how to configure an AI-native workflow, organize agent responsibilities, provide context, verify generated work, and keep people accountable for important decisions.

It is not a universal standard, a claim of fully autonomous software delivery, or a reproduction of any employer's internal systems. All examples are original, fictional, and safe to adapt.

## Start here

**New to the course? Start with [Lesson 01 — From AI-Assisted to AI-Native Engineering](lessons/01-ai-native-engineering.md).**

Follow the lessons in order. Each lesson contains:
- The concepts and reasoning behind the topic
- A practical walkthrough using one fictional product
- Hands-on tasks and links to all related artifacts
- **10 multiple-choice knowledge-check questions**
- An answer key with short explanations, hidden in a collapsible section so you can test yourself first

There are 12 lessons. You can complete them independently at your own pace. No account, backend, or paid course platform is required; the course is readable directly in GitHub.

## Course roadmap

| # | Lesson | What you will produce |
|---|---|---|
| 01 | [From AI-Assisted to AI-Native Engineering](lessons/01-ai-native-engineering.md) | A shared mental model and lifecycle map |
| 02 | [Understanding the AI-Native SDLC](lessons/02-ai-assisted-vs-ai-native.md) | A current-state and target-state workflow map |
| 03 | [Choosing the First Workflow](lessons/03-spec-driven-development.md) | A scoped pilot and success criteria |
| 04 | [Preparing the Repository and Agent Context](lessons/04-agent-architecture.md) | A project context and agent contract |
| 05 | [Spec-Driven Development in Practice](lessons/05-claude-code-setup.md) | An approved, testable feature specification |
| 06 | [Configuring Agent Capabilities](lessons/06-custom-skills-and-commands.md) | Reusable skills, commands, and hooks |
| 07 | [Designing the Agentic Workflow](lessons/07-agentic-workflows.md) | A staged workflow with handoffs and stop conditions |
| 08 | [AI-Assisted Implementation](lessons/08-ai-powered-testing.md) | A bounded implementation plan and change |
| 09 | [Testing and Verification](lessons/09-ai-code-review.md) | A risk-based test strategy and evidence |
| 10 | [Code Review, Quality Gates, and Evaluation](lessons/10-quality-gates-and-evaluation.md) | Review criteria and an evaluation approach |
| 11 | [Governance, Human Oversight, and Adoption](lessons/11-human-in-the-loop-and-safety.md) | Guardrails, ownership, and an adoption plan |
| 12 | [End-to-End Implementation: Subscription Upgrade](lessons/12-adoption-and-measuring-impact.md) | A complete workflow from business request to measured outcome |

## The practical case study: Subscription Platform

Throughout the course, we use a fictional subscription product. The capstone is a plan-upgrade feature. The scenario is intentionally small enough to understand but rich enough to explore requirements, agent context, implementation, tests, review, quality gates, approvals, and measurement.

Start with the [Subscription Platform case study](examples/subscription-platform/README.md).

**Important:** business rules such as proration, refunds, billing dates, and entitlement changes are deliberately left open. The learner must identify questions and get decisions from a product/domain owner rather than allowing an agent to invent business behavior.

## Repository map

- `lessons/` — the guided course, including the 10-question knowledge check at the end of each lesson
- `examples/` — practical templates and reference artifacts used by the lessons
- `assessments/` — workflow maturity assessment

## How to use the course

1. Open Lesson 01 from the link above.
2. Read the lesson and inspect the linked artifacts.
3. Complete the practical exercise in your own copy or branch of the repository.
4. Answer the 10 questions without opening the answer key.
5. Review the explanations and revisit any topic you missed.
6. Continue using the **Next lesson** link at the bottom of the page.

The quizzes are self-assessment, not a proctored exam. GitHub Markdown does not persist quiz scores or provide a learning-management-system experience.

## Learning principles

- Start with a real engineering problem, not with a tool.
- Give agents explicit context, scope, and expected outputs.
- Make requirements and acceptance criteria testable.
- Prefer deterministic verification for mandatory controls.
- Keep production, security, product, and risk decisions with accountable humans.
- Measure delivery outcomes together with quality, stability, and cost.

## Contributing and license

See [CONTRIBUTING.md](CONTRIBUTING.md). The repository is published under the [MIT License](LICENSE).
