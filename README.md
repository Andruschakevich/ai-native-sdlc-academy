# AI-Native SDLC Academy

> A practical, self-paced academy for designing a production-oriented AI-native delivery system for an existing product.

This academy documents an approach to AI-native engineering learned and applied in engineering work. It is an educational project with original fictional examples. It is not SIXT material, an export of any employer internal systems, or a claim that the examples are production implementations.

## Start here

Begin with [Lesson 01 — AI SDLC Fundamentals](lessons/01-ai-sdlc-fundamentals.md), then follow all 12 lessons in order. Each lesson includes detailed concepts, a worked example from the same fictional product, a practical exercise, links to completed artifacts and 10 lesson-specific knowledge-check questions with answer explanations.

## Course brief

| Dimension | Decision |
|---|---|
| Delivery scope | Business and software delivery |
| Starting point | Existing brownfield product |
| Target autonomy | L4 — bounded autonomy |
| Primary execution engine | Claude / Anthropic |
| Architecture | Vendor-aware, portable workflow principles |
| Priorities | Speed, quality, safety and business outcome |
| First use case | Self-service subscription management, from request to measured production outcome |

## Roadmap

| # | Lesson | Main output |
|---|---|---|
| 01 | [AI SDLC Fundamentals](lessons/01-ai-sdlc-fundamentals.md) | Target lifecycle and autonomy model |
| 02 | [Intent Engineering](lessons/02-intent-engineering.md) | Business Intent and GO / CLARIFY / STOP |
| 03 | [Product & System Discovery](lessons/03-product-system-discovery.md) | Evidence-backed context, domain model and impact analysis |
| 04 | [Specification Engineering](lessons/04-specification-engineering.md) | Requirements, business rules, acceptance criteria and traceability |
| 05 | [Architecture & Planning](lessons/05-architecture-planning.md) | Architecture, ADRs, dependency graph and work packages |
| 06 | [Claude Code Engineering](lessons/06-claude-code-engineering.md) | CLAUDE.md, Rules, Skills, Subagents, Hooks, MCP and permissions |
| 07 | [Agent Orchestration](lessons/07-agent-orchestration.md) | Orchestrator, state, handoffs, retries and gates |
| 08 | [AI Implementation](lessons/08-ai-implementation.md) | Bounded implementation and evidence |
| 09 | [Quality Engineering](lessons/09-quality-engineering.md) | Independent verification and risk-based testing |
| 10 | [Release & Operations](lessons/10-release-operations.md) | Progressive delivery, observability and recovery |
| 11 | [Governance & Business Metrics](lessons/11-governance-business-metrics.md) | Policies, permissions, audit, cost and autonomy metrics |
| 12 | [End-to-End Implementation](lessons/12-end-to-end-implementation.md) | Integrated delivery architecture and capstone |

## Case study

All lessons use one fictional brownfield subscription platform. The feature includes upgrade, downgrade, billing-cycle changes, cancel, pause, resume and reactivate. Start with [the case-study overview](case-study/README.md) and use the [artifact index](case-study/ARTIFACT-INDEX.md) to navigate the completed documents.

Case-study decisions are training assumptions, not universal industry rules. Real product owners must validate them. No real payment provider, production environment, customer data or credentials are used.

## Learning path

1. Read each lesson in sequence.
2. Inspect the linked artifacts and follow references to upstream decisions.
3. Complete the practical exercise in a branch or your own copy.
4. Answer the 10 questions before opening the answer key.
5. Continue using the Next lesson link.

Quizzes are self-assessment. GitHub Markdown does not persist scores or provide an LMS experience.

## Repository map

- lessons/ — 12 guided lessons.
- case-study/ — interconnected Subscription Management artifacts.
- skills/ — example Claude Code skills.
- claude-code/ — context, rules, agents and permissions examples.
- orchestration/ — workflow state, work packages and execution evidence.
- quality/ — test strategy and verification report.
- release/ — release and operations policy.
- governance/ — policies, permissions, approvals and metrics.
- reference/ — target architecture and autonomy model.

## Important boundaries

- All product names, services, data and metrics in the case study are fictional.
- Agent instructions communicate rules but do not enforce security. Use tool permissions, IAM, sandboxing, CI/CD and policy controls.
- Humans retain accountability for business decisions and high-impact approvals.
- Claude Code is the first execution engine discussed; workflow and control-plane principles are portable.

## License

MIT. See [LICENSE](LICENSE).