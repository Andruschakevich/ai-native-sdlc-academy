# AI-Native SDLC Academy

A practical, hands-on academy for engineering leaders and software teams adopting AI agents across the software delivery lifecycle.

> **Purpose:** teach teams how to move from isolated AI-assisted coding to governed, measurable, agentic engineering workflows.

This is an independent educational project and reference implementation. It does not contain proprietary source code, prompts, documents, configurations, or confidential materials from any employer. Examples are illustrative and designed to be adapted.

## Who this is for

- Engineering Managers, Tech Leads, Staff Engineers, and platform teams
- Developers adopting agentic coding tools
- Organizations designing AI enablement programs and engineering guardrails

## What you will learn

1. Explain the shift from AI-assisted coding to AI-native engineering.
2. Apply Spec-Driven Development (SDD) to make work legible to agents.
3. Design bounded agent workflows with explicit inputs, outputs, and permissions.
4. Configure reusable instructions, skills, and commands.
5. Add validation, testing, review, and human approval gates.
6. Evaluate agent output quality and operational impact.
7. Lead adoption through enablement, coaching, and measurable outcomes.

## Learning path

| # | Lesson | Practical output |
|---|---|---|
| 01 | [AI-Native Engineering](lessons/01-ai-native-engineering.md) | SDLC capability map |
| 02 | [From AI Assistance to AI-Native Workflows](lessons/02-ai-assisted-vs-ai-native.md) | Workflow maturity assessment |
| 03 | [Spec-Driven Development](lessons/03-spec-driven-development.md) | Feature specification |
| 04 | [Agent Architecture](lessons/04-agent-architecture.md) | Agent contract and boundaries |
| 05 | [Claude Code Setup](lessons/05-claude-code-setup.md) | Repository-level agent context |
| 06 | [Skills, Commands, and Hooks](lessons/06-custom-skills-and-commands.md) | Reusable skill and hook examples |
| 07 | [Agentic Engineering Workflows](lessons/07-agentic-workflows.md) | End-to-end workflow |
| 08 | [AI-Powered Testing](lessons/08-ai-powered-testing.md) | Risk-based test strategy |
| 09 | [AI Code Review](lessons/09-ai-code-review.md) | Review checklist and workflow |
| 10 | [Quality Gates and Evaluation](lessons/10-quality-gates-and-evaluation.md) | Evaluation rubric and CI gate |
| 11 | [Human-in-the-Loop and Safety](lessons/11-human-in-the-loop-and-safety.md) | Approval and escalation policy |
| 12 | [Adoption and Measuring Impact](lessons/12-adoption-and-measuring-impact.md) | Adoption and metrics playbook |

## Repository map

- `lessons/` — lesson guides, concepts, exercises, and links to practical work
- `examples/` — illustrative agent configuration, specs, workflows, quality gates, and evaluation assets
- `assessments/` — maturity and readiness assessment materials

## Hands-on scenario

The academy uses a fictional **Subscription Platform** as a consistent example. Learners will work through a feature request, write a specification, delegate bounded tasks to agents, validate changes, and prepare a human-reviewed release.

Start with [the scenario](examples/subscription-platform/README.md).

## Suggested learning sequence

- **Foundation:** Lessons 01–04
- **Tooling and workflows:** Lessons 05–09
- **Governance and scale:** Lessons 10–12

Each lesson includes learning objectives, key concepts, a practical exercise, expected outcomes, and links to repository artifacts.

## Important implementation notes

- Tool-specific examples are templates, not claims that a particular tool version or configuration is universally supported.
- Hook examples must be reviewed and tested in a safe local environment before use.
- Never place secrets, customer data, or proprietary source code in prompts or repository artifacts.
- AI-generated output is untrusted until validated. Production changes and releases require the organization's normal approval process.
- Metrics in examples are illustrative unless explicitly identified as measured results from a real, authorized case study.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT. See [LICENSE](LICENSE).
