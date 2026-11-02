# Lesson 07 — Agent Orchestration

**Outcome:** Coordinate specialized agents through durable state, explicit contracts, dependency-aware scheduling, bounded retries and approval gates.

## 1. Multi-agent is not orchestration

A multi-agent system has multiple specialized agents. Orchestration is the control system that determines:
- which task runs next;
- who owns it;
- what inputs and permissions it receives;
- which dependencies must be complete;
- how results are verified;
- what happens on failure;
- when the workflow stops or requests a human decision.

Launching five agents simultaneously is not an orchestration architecture. It can simply multiply ambiguity, cost and conflicting edits.

## 2. Logical architecture

For the fictional Subscription Management initiative:

- **Orchestrator:** owns workflow progression and policy checks.
- **Planner:** decomposes the approved feature into work packages.
- **Scheduler:** selects eligible packages and concurrency limits.
- **State Manager:** persists project, package and execution state.
- **Workers:** implement bounded tasks or perform specialist analysis.
- **Reviewers:** independently assess code, security and evidence.
- **Policy/Approval Gate:** determines permitted actions and required human approvals.
- **Recovery:** handles retries, escalation and safe resumption.

These can be modules in one platform; they do not need to be separate microservices or LLMs.

## 3. Five orchestration patterns

### Sequential
Use when a stage depends on a prior decision or artifact. Example: do not implement billing before financial rules and service contracts are approved.

### Parallel
Use when tasks are independent, contracts are stable, ownership is clear and workspaces are isolated. Example: after Domain Operations contract approval, separate agents can implement distinct operation slices.

### Hierarchical
A top-level orchestrator delegates a bounded subsystem to a sub-orchestrator. Useful for multi-repository or multi-team changes, but avoid unlimited nesting.

### Generator–Critic
One agent creates a result; another independently challenges it. Useful for requirements, architecture and high-risk code. The reviewer must inspect source evidence, not simply accept the generator's explanation.

### Evaluator / Tournament
Several independent agents propose alternatives; an evaluator compares them against explicit criteria. Reserve this for consequential decisions with genuinely different options. Multiple agents sharing the same false premise can all be wrong.

## 4. Subagents versus Agent Teams

Subagents are useful for bounded specialist tasks whose result returns to the caller: code search, security review, test gap analysis, contract inspection.

Agent Teams provide multiple independent sessions with more direct coordination and shared task awareness. They may be useful for large collaborative work, but add cost and coordination complexity; feature availability and maturity can change, so verify current Claude Code documentation before adopting them.

Start with a main agent and subagents. Introduce teams only when peer communication and independent execution materially improve the workflow.

## 5. Durable workflow state

Never rely only on conversation history. Store state outside agent sessions.

### Project state
Approved intent/specification versions, ADRs, invariants, global constraints, owners.

### Work package state
ID, objective, dependencies, owner, assigned role, workspace, branch, allowed paths, acceptance criteria, risk, approvals and verification.

### Agent execution state
Model profile, tool permissions, start/end, actions, outputs, retries, cost, findings, handoff and execution status.

A package may move through:

`DRAFT → READY → IN_PROGRESS → IMPLEMENTED → VERIFIED → APPROVED → DONE`

Alternative states include `BLOCKED`, `NEEDS_FIX`, `CLARIFICATION_REQUIRED`, `APPROVAL_PENDING` and `CANCELLED`.

Do not let the Implementation Agent set VERIFIED or APPROVED. IMPLEMENTED means code work is reported complete; VERIFIED means independent checks passed; APPROVED means the authorized reviewer approved; DONE means all package conditions are satisfied.

The [workflow-state.json](../orchestration/workflow-state.json) is a simple illustrative snapshot, not a substitute for durable transactional workflow storage.

## 6. Agent handoff contract

A handoff should be machine-readable or consistently structured:

```json
{
  "task_id": "WP-05",
  "status": "IMPLEMENTED",
  "summary": "Immediate upgrade flow prepared for independent review",
  "changed_files": ["src/subscriptions/upgrade/*"],
  "acceptance_criteria": {
    "AC-01": "PASS",
    "AC-02": "PASS",
    "AC-05": "NOT_RUN"
  },
  "tests": {
    "unit": "PASS",
    "integration": "NOT_RUN"
  },
  "assumptions": [],
  "open_questions": ["Provider idempotency retention needs confirmation"],
  "risks": ["Entitlement reconciliation failure path requires test evidence"],
  "next_recommended_action": "Independent verification"
}
```

The report must reflect actual evidence. Never mark a test PASS because the agent expects it to pass.

## 7. Dependency-aware scheduling

A possible execution sequence:

1. WP-01: confirm domain/service contracts, role model and sources of truth.
2. WP-02: eligibility and authorization.
3. WP-03: authoritative price and discount preview.
4. WP-04: idempotent operation model.
5. WP-05: immediate upgrade.
6. WP-06: scheduled downgrade and billing-cycle change.
7. WP-07: cancel, pause, resume and reactivate.
8. WP-08: entitlement update and reconciliation.
9. WP-09: audit, notification and analytics.
10. WP-10: independent verification.
11. WP-11: progressive release and observation.

Some tasks can run in parallel after shared contracts are stable. For example, documentation and independent test design may proceed alongside implementation if file ownership is separate. Upgrade and downgrade workers must not invent different subscription state contracts.

Limit concurrency. Three coordinated workers with clean boundaries may outperform ten agents fighting over shared files and CI resources.

## 8. Conflict resolution

| Conflict | Correct response |
|---|---|
| Same file edited by two workers | Stop integration, compare changes, assign owner and rebase/merge deliberately |
| API contract mismatch | Block dependent work and return to contract owner |
| Business rule disagreement | Refer to approved Business Rules; CLARIFY with Product Owner if missing |
| Test ownership overlap | Define test file ownership or separate test-design from test-implementation |
| Different architecture proposals | Compare against ADR drivers; Engineering Owner decides |
| Security finding | Block approval until resolved or explicitly risk-accepted by authorized owner |

Business rules are not settled by agent voting or Git conflict resolution.

## 9. Failure recovery and bounded loops

Classify failures before retrying:
- transient tool/provider error: bounded retry with backoff;
- test failure: send exact failing evidence to implementation owner;
- missing context: request discovery or clarification;
- architecture contradiction: return to ADR/owner;
- file conflict: isolate and integrate;
- security issue: block and escalate;
- budget/timeout exhausted: stop and preserve handoff.

Illustrative starting policy:
- up to 2 automatic retries for transient tool failures;
- up to 2 repair cycles for ordinary test failures;
- critical business/security contradiction requires human escalation;
- every retry records cause and changes the input or action.

Stop conditions:
- all required ACs and checks have evidence;
- no open Critical/High finding;
- no unresolved business contradiction;
- retry, time and cost budgets not exceeded;
- required approvals recorded.

Never create an infinite implementation → review → implementation loop.

## 10. End-to-end orchestration example

For Subscription Management:
- Orchestrator validates approved intent/specification and work package readiness.
- Policy Engine classifies risk and creates a permission profile.
- Scheduler selects WP-05 after dependencies are complete.
- Implementation Agent works in its isolated workspace.
- CI runs required checks.
- Verification Agent inspects diff and evidence independently.
- Security Reviewer checks authorization, payment and data boundaries.
- Orchestrator records findings and moves to NEEDS_FIX or VERIFIED.
- Human approver handles merge/release gates according to policy.

See [work-package contracts](../orchestration/work-packages.md), [approval matrix](../governance/approval-matrix.md) and [agent permissions](../governance/agent-permissions.yaml).

## 11. Measuring orchestration

Measure:
- work package cycle time and queue time;
- dependency wait time;
- completion and first-pass verification rate;
- file/contract conflicts;
- retries and escalation rate;
- handoff failure rate;
- cost per accepted work package;
- coordination overhead;
- human intervention by risk class.

Agent count is not a productivity metric.

## 12. Practical exercise

Given three packages (Upgrade, Downgrade, Lifecycle), one shared Domain Operations contract, independent security review and required integration tests:
1. Decide which tasks can run in parallel.
2. Assign contract ownership.
3. Define workspaces and permissions.
4. Specify states and handoffs.
5. Set retry budgets and stop conditions.
6. Identify human approval gates.

**Next:** [Lesson 08 — AI Implementation](08-ai-implementation.md).

## Knowledge check — 10 questions

1. What distinguishes orchestration from merely launching multiple agents?  
   A. Number of agents. B. Planning, scheduling, state, validation, recovery and governance. C. Model size. D. Number of prompts.

2. When is parallel execution appropriate?  
   A. Before contracts are known. B. When dependencies and ownership are clear and work is isolated. C. Whenever tasks have different names. D. When agents can vote on business rules.

3. What is the difference between IMPLEMENTED and VERIFIED?  
   A. None. B. IMPLEMENTED is author-reported completion; VERIFIED is independently evidenced. C. VERIFIED means deployed. D. IMPLEMENTED means approved by Product.

4. Why persist workflow state outside agent conversation?  
   A. Conversations cannot contain text. B. Work must survive session loss and be auditable/resumable. C. It makes model reasoning better. D. It replaces Git.

5. What is a good use of Generator–Critic?  
   A. Independent review of a high-risk implementation against approved requirements. B. Have two agents write the same file. C. Allow agents to choose business pricing. D. Replace tests.

6. A webhook contract is changed by one worker while another implements its consumer. What should the orchestrator do?  
   A. Merge first completed PR. B. Stop dependent integration and resolve contract ownership/version. C. Ask the agents to vote. D. Ignore compatibility.

7. What should happen after repeated identical test repair failures?  
   A. Continue forever. B. Increase concurrency. C. Stop, preserve evidence and escalate the likely specification/context/design issue. D. Delete the test.

8. Which status may an Implementation Agent assign to its own output?  
   A. APPROVED. B. VERIFIED. C. IMPLEMENTED. D. RELEASE_COMPLETE.

9. Why use isolated workspaces?  
   A. To avoid every test. B. To reduce file conflicts and make changes independently reviewable. C. To grant production access. D. To hide diffs.

10. What is a meaningful orchestration metric?  
    A. Number of agents started. B. Cost per accepted work package and conflict/retry rates. C. Total prompts. D. Lines of generated code.

### Answer key and explanations

1. **B** — Orchestration is lifecycle control, not parallelism alone.  
2. **B** — Stable dependencies and isolated ownership make parallel work safe.  
3. **B** — Author report and independent verification are distinct states.  
4. **B** — Durable state supports recovery and audit.  
5. **A** — Critique must be grounded in independent evidence.  
6. **B** — Shared contracts require coordinated ownership.  
7. **C** — Repeating the same failing loop is not recovery.  
8. **C** — An agent may report implementation completion, not certify itself.  
9. **B** — Workspace isolation reduces accidental cross-agent interference.  
10. **B** — Accepted work and coordination cost matter more than agent activity.
