# Lesson 06 — Claude Code Engineering

**Outcome:** Configure Claude Code as a controlled engineering environment using context, rules, reusable skills, subagents, hooks, MCP and permissions.

## 1. Claude Code is an execution engine, not the SDLC architecture

The course is Claude-centric because Claude Code is the concrete coding environment used in the original learning path. But the workflow contracts should remain portable.

The previous lesson produced an approved architecture proposal and work packages. This lesson turns those into an agent environment where the agent:
- understands the product;
- loads relevant context;
- follows repeatable procedures;
- uses specialist agents where useful;
- has only the permissions required;
- leaves evidence and a structured handoff.

## 2. Six mechanisms — six distinct jobs

| Mechanism | Question | Subscription example |
|---|---|---|
| CLAUDE.md | What project context should be readily available? | Product, architecture, commands, invariants and artifact links |
| Rules | Which constraints apply to this path or domain? | SQL migration and security rules |
| Skills | How should a repeatable workflow be performed? | Implement approved work package |
| Subagents | Who performs isolated specialist work? | Read-only Discovery or Security Reviewer |
| Hooks | Which deterministic action/check runs on an event? | Block unsafe command patterns, format or run targeted checks |
| MCP | Which external systems/tools can the agent access? | GitHub, issue tracker, docs, CI and observability |

They are not interchangeable. A long CLAUDE.md is not a permissions system. A Skill is not a security boundary. MCP connection does not imply write access.

## 3. CLAUDE.md as an index and project contract

Do not put the entire product encyclopedia into the root file. Keep it concise and link to authoritative artifacts.

A useful structure:
- product summary and repository map;
- build/test commands confirmed during Discovery;
- coding conventions;
- high-risk domains and invariants;
- links to System Context, Domain Model, requirements and ADRs;
- workflow expectations and stop conditions.

Example based on the training case:

```markdown
# Project Context
Product: Subscription Management Platform (fictional training case).

## Source of truth
- Business intent: docs/business-intent.md
- System context: docs/system-context.md
- Domain model: docs/domain-model.md
- Requirements: docs/requirements.md
- Business rules: docs/business-rules.md
- Architecture decisions: docs/architecture/adr/

## Principles
- Never invent business rules.
- Billing, payment, identity and entitlement changes are high risk.
- Preserve backward compatibility unless explicitly approved.
- Inspect actual code and tests before editing.
- Stop on contradictions or missing critical context.

## Workflow
Understand → inspect → plan → implement bounded scope → verify → report.
```

The command examples in the source material were intentionally placeholders. In a real repository, discover actual commands; never invent `npm test` or a build command just because it is familiar.

## 4. Rules: scoped constraints

Path-specific rules prevent irrelevant instructions from filling every session's context.

Example:

```markdown
---
paths:
  - "services/**/migrations/**"
  - "**/*.sql"
---

# Database Rules
- Never edit an already-applied migration.
- Prefer expand → migrate → contract for compatible schema evolution.
- Document rollback/roll-forward and data-integrity implications.
- Never run migrations against production from an implementation session.
- Add tests for constraints and data integrity.
```

Security rules should state backend authorization, account isolation, secret handling, safe logging, review requirements and prohibited production actions.

## 5. Skills: encode repeatable engineering practice

A Skill should be a reusable procedure with preconditions, inputs, steps, constraints, outputs and stop conditions.

Example [Implement Work Package Skill](../skills/implement-work-package/SKILL.md):
1. Read the task packet and linked artifacts.
2. Confirm package status and dependencies.
3. Inspect relevant code and tests.
4. Establish baseline behavior.
5. Plan the smallest safe change.
6. Add/update tests from approved ACs.
7. Implement only assigned scope.
8. Run required checks.
9. Inspect full diff.
10. Return evidence, limitations and status.

Do not create a large library of Skills before proving the workflows are reused. Start with Discovery, implementation and independent review; add others as repeated needs appear.

## 6. Subagents: isolated specialist work

A Skill describes *how* to perform a procedure. A subagent is a specialist executor with a distinct role, context and tool permissions.

Examples:
- Discovery Agent: read-only code/system exploration;
- Security Reviewer: read-only analysis of auth, secrets, data boundaries and payment flow;
- Test Engineer: test design and controlled test execution;
- Architecture Reviewer: review alternatives and cross-service impact.

A subagent is not automatically independent merely because it has a different name. Independence requires separate context, direct access to requirements and diff, and its own evidence.

## 7. Hooks: deterministic checks and action boundaries

Hooks can run at lifecycle events, but they should complement—not replace—tool permissions, IAM, sandboxing and CI.

Useful examples:
- block prohibited commands;
- validate protected file paths;
- format changed files;
- run targeted tests after relevant changes;
- log tool activity;
- check required completion metadata.

A brittle text search for the word “production” is not a security control. Commands can be wrapped, aliased or expressed indirectly. For high-risk actions, remove credentials/network access or enforce policy at the tool boundary.

## 8. MCP: controlled access to engineering systems

MCP can connect the agent to GitHub, Jira/Linear, documentation, CI results and observability. Roll out access gradually:

1. repository and issue tracker read-only;
2. documentation and CI read-only;
3. limited PR creation;
4. scoped observability access with redaction;
5. write actions only when justified and auditable.

Never provide a coding agent access to real customer payment actions or unrestricted production systems. Distinguish information access, repository modification, deployment and financial authority.

## 9. Permissions and isolation

Use least privilege and enforce it outside natural-language instructions.

| Capability | Discovery | Implementation | Verification |
|---|---|---|---|
| Source read | Yes | Yes | Yes |
| Source write | No | Assigned workspace only | No |
| Tests | Read/run approved | Run/add in workspace | Run approved suites |
| Production DB | No | No | No |
| Secrets | No direct access | No direct access | No direct access |
| PR creation | No | Policy-scoped | No |
| Merge/deploy | No | No | No |

Git worktrees isolate working trees and branches, but are not full sandboxes. They do not necessarily isolate credentials, network, filesystem or external systems. Use ephemeral environments, scoped tokens, filesystem/network restrictions and CI enforcement as appropriate.

## 10. Context Engineering and handoff

Do not give every agent the entire repository and every historical conversation. Give it:
- the exact work package;
- relevant requirements and ACs;
- applicable ADR and invariants;
- relevant service/contract references;
- permission profile and allowed paths;
- evidence expectations and stop conditions.

A handoff should preserve state beyond the agent session:

```markdown
# Agent Handoff
## Task
WP-05 — Immediate Upgrade
## Completed
- ...
## Changed files
- ...
## Verification
- Unit: PASS / FAIL / NOT RUN
- Integration: PASS / FAIL / NOT RUN
## Decisions
- ...
## Open questions
- ...
## Risks
- ...
## Next step
- ...
```

This makes the workflow resumable and auditable.

## 11. Practical setup for this academy

Inspect:
- [CLAUDE.md](../claude-code/CLAUDE.md)
- [Security rules](../claude-code/rules/security.md)
- [Database rules](../claude-code/rules/database.md)
- [Agent permissions](../governance/agent-permissions.yaml)
- [Discovery Skill](../skills/discovery/SKILL.md)
- [Implementation Skill](../skills/implement-work-package/SKILL.md)
- [Verification Agent](../claude-code/agents/verification-agent.md)

The configuration is an educational starting point. Validate exact Claude Code syntax and available features against the current product version before using it in a real environment.

## 12. Practical exercise

Design a minimal Claude Code setup for WP-05:
1. Draft a short root CLAUDE.md index.
2. Create a path-scoped billing rule.
3. Define an implementation Skill.
4. Define a read-only Security Reviewer.
5. Specify a hook and a separate technical enforcement control.
6. Write an explicit permission profile.
7. Produce an Agent Handoff schema.

**Next:** [Lesson 07 — Agent Orchestration](07-agent-orchestration.md).

## Knowledge check — 10 questions

1. What belongs in CLAUDE.md?  
   A. Every product document. B. Concise project context, commands, principles and links to authoritative artifacts. C. Production credentials. D. The full audit log.

2. What is the main purpose of Rules?  
   A. Run workflow state. B. Provide applicable constraints, often scoped to paths or task types. C. Replace permissions. D. Store model costs.

3. How does a Skill differ from a subagent?  
   A. Skill is a repeatable procedure; subagent is a specialist executor. B. They are identical. C. Skill grants production access. D. Subagent stores business intent.

4. What is the strongest security control for prohibited production access?  
   A. “Please do not” in prompt. B. A markdown checklist only. C. No credentials/network path plus enforced tool/IAM permissions. D. Agent self-report.

5. What are Hooks best suited for?  
   A. Deterministic lifecycle checks and automation. B. Making business decisions. C. Replacing a sandbox. D. Approving refunds.

6. What is MCP used for?  
   A. Model training. B. Controlled connection to external tools and systems. C. Database schema migration only. D. Replacing CI.

7. Why are Git worktrees not full security sandboxes?  
   A. They cannot isolate branches. B. They do not necessarily isolate credentials, network or filesystem access. C. They prevent testing. D. They delete source.

8. What makes a Security Reviewer independent?  
   A. Different agent name. B. Separate context, read-only access, approved requirements and direct evidence review. C. Same implementation report only. D. Same mutable workspace.

9. Why keep CLAUDE.md concise?  
   A. To hide important rules. B. To reduce irrelevant context and link to authoritative detailed artifacts. C. To avoid version control. D. Because agents cannot read Markdown.

10. What must be included in a useful handoff?  
    A. “Done”. B. Summary, changed files, actual verification, decisions, open questions, risks and next step. C. Only token usage. D. The full hidden reasoning trace.

### Answer key and explanations

1. **B** — It is an index and concise project contract.  
2. **B** — Rules add relevant constraints without overloading all sessions.  
3. **A** — One is the procedure, the other the executor.  
4. **C** — Security must be enforced outside the model's instructions.  
5. **A** — Hooks are useful for repeatable event-triggered checks.  
6. **B** — MCP exposes approved external capabilities.  
7. **B** — Git isolation is not equivalent to environment isolation.  
8. **B** — Independence is about evidence and context, not labels.  
9. **B** — Context quality matters more than context volume.  
10. **B** — Structured handoffs support resumability and auditability.
