# Lesson 01 — AI SDLC Fundamentals

**Level:** Advanced · **Target:** L4 bounded autonomy · **Case study:** Self-Service Subscription Management  
**Outcome:** Design the delivery system before selecting agents or automating coding.

## 1. Start with delivery, not code generation

A business request is not yet an engineering task. Consider two requests:

- “We are losing users during registration. Improve conversion.”
- “Add self-service subscription management.”

A conventional coding assistant may translate either sentence into a code change too early. An AI-native delivery system first establishes whether the request is understood, whether software is the right intervention, what evidence is available, and what risks must be controlled.

For the registration example, the system might inspect funnel analytics, identify where users abandon, compare segments, review performance and UX evidence, propose hypotheses, and recommend an experiment. It may conclude that the best action is a copy change, an operational fix, an experiment, or no code at all.

For this academy, we use the second request as the single end-to-end case:

> Allow account administrators to manage subscriptions themselves, reducing Customer Support workload and improving customer experience without breaking billing, payments, subscription state, entitlements or discount policies.

The case is deliberately brownfield: an existing product, service boundaries, historical behavior and integrations already exist. The system must understand and extend it rather than design a greenfield replacement.

See [the case-study overview](../case-study/README.md) and the approved [Business Intent](../case-study/01-intent/business-intent.md).

## 2. What “end-to-end” means

The lifecycle is broader than “prompt → code → PR”:

1. **Intent:** understand the business problem, users, outcomes, constraints and decision owner.
2. **Discovery:** inspect the existing product and produce evidence-backed system and domain context.
3. **Specification:** convert intent and discovery into testable, traceable requirements.
4. **Architecture and planning:** decide how the change fits the system and decompose it into bounded work.
5. **Agent environment:** provide context, reusable procedures, specialized roles and enforced permissions.
6. **Orchestration:** schedule work, manage state, dependencies, retries and handoffs.
7. **Implementation:** execute approved work packages and return evidence.
8. **Quality engineering:** independently verify requirements, behavior, security and reliability.
9. **Release and operations:** progressively expose the change, monitor invariants and recover safely.
10. **Outcome measurement:** determine whether the business problem was actually improved.

A successful deployment is not automatically successful delivery. If an upgrade is deployed but customers still need Support, receive an unexpected price or fail to receive entitlements, the business outcome has not been achieved.

## 3. Five design principles

### 3.1 Intent before implementation

The system must be allowed to return **GO**, **CLARIFY** or **STOP**. GO at one stage only authorizes the next stage: “GO for Discovery” is not “GO for implementation” and certainly not production approval.

### 3.2 Specifications are the contract

People, agents and deterministic checks should refer to the same versioned requirements, rules, acceptance criteria and constraints. A chat transcript is not a durable contract.

### 3.3 Generation is not verification

The agent that writes a change cannot be the sole evidence that the change is correct. Tests, contract checks, security controls, independent review and production signals have distinct roles.

### 3.4 Autonomy is bounded by action and risk

Do not assign one global “autonomous” switch to a project. Reading source, editing an isolated workspace, merging a billing change, deploying to production and issuing a refund are different actions with different consequences.

### 3.5 Optimize outcomes, not AI activity

Token count, generated lines, number of agents and PR volume are not business outcomes. Measure delivery time, accepted changes, reliability, customer outcomes, cost and recovery.

## 4. Autonomy model used in this course

This L0–L5 scale is a practical design model for the academy, not an industry certification.

| Level | Meaning | Subscription example |
|---|---|---|
| L0 — Manual | Human performs the work | Engineer manually investigates and changes code |
| L1 — Assisted | AI drafts or suggests | AI drafts acceptance criteria; human applies them |
| L2 — Repeatable workflow | AI follows a defined sequence | Generate tests and implementation plan from approved spec |
| L3 — Supervised agent | Agent plans and executes bounded tasks with frequent review | Agent investigates, implements and opens a PR |
| L4 — Bounded autonomy | Workflow executes approved task classes without per-step approval, with enforced limits and independent gates | Agent completes an approved low/medium-risk package, CI and verification; high-risk merge/release remains gated |
| L5 — Adaptive system | System improves workflow within approved policy boundaries | Evaluation data informs versioned workflow changes, never self-granted permissions |

L4 does not mean “AI can do everything”. For billing and financial state, the system can automate discovery, implementation, testing and safe rollout controls while requiring accountable human approval for defined actions.

### L4 readiness test

For every autonomous action, define:
- objective and scope;
- environment and data classification;
- allowed tools and paths;
- preconditions and dependencies;
- expected output and evidence;
- deterministic checks;
- stop and escalation conditions;
- recovery path;
- accountable owner.

If any of these are unknown for a high-risk action, reduce autonomy or block it.

## 5. The three planes of an AI-native SDLC

| Plane | Question | Typical components |
|---|---|---|
| Orchestration | Who does what next, and what happens on failure? | Workflow engine, planner, scheduler, state manager, retry policy |
| Execution | Who performs the task? | Coding agent, discovery agent, QE agent, CI tools |
| Control and evidence | How do we constrain and verify actions? | Specs, permissions, policy checks, tests, audit, approvals |

Not every stage needs a separate LLM agent. A deterministic test can verify a property more reliably than another model call. One agent can perform several sequential steps. Add agents only when specialization, context isolation or parallelism justifies their coordination cost.

## 6. Target architecture for this course

The course adopts a Claude-centric execution environment because Claude Code is the concrete tool used in the original learning path. The SDLC principles remain portable: another coding agent can implement the same workflow contracts.

- **Business/Product layer:** intent, domain knowledge, specifications, ADRs.
- **Orchestration layer:** workflow state, dependencies, budgets, policy decisions and audit.
- **Agent layer:** discovery, specification, architecture, implementation, verification, security, release and operations roles.
- **Engineering systems:** Git, issue tracker, CI/CD, test environments, feature flags and observability.
- **Human decision layer:** Product Owner, Engineering Owner, Security Owner and Release Approver.

The full target is assembled in [Lesson 12](12-end-to-end-implementation.md) and [the target architecture reference](../reference/target-architecture.md).

## 7. Practical exercise

Take a vague request from a product stakeholder. Do not write code. Produce a one-page delivery brief containing:
1. business problem and evidence;
2. target users;
3. expected outcome and possible measures;
4. constraints and risks;
5. unknowns;
6. which next stage is authorized;
7. actions that must remain human-approved.

For the academy case, inspect the [Business Intent](../case-study/01-intent/business-intent.md). Note that its metrics are training targets, not observed results.

## 8. Lesson output and readiness

You should now be able to explain why AI-native SDLC is a controlled delivery system rather than an AI coding assistant, distinguish the three planes, and describe L4 boundaries.

**Next:** [Lesson 02 — Intent Engineering](02-intent-engineering.md), where the vague request becomes a reviewed Business Intent.

## Knowledge check — 10 questions

Choose one best answer per question. The answer key follows the questions so you can self-assess without an LMS.

1. A stakeholder says, “Improve subscription conversion.” What should the system do first?  
   A. Generate a new checkout page. B. Clarify the problem, users, evidence and desired outcome. C. Launch three coding agents. D. Increase deployment frequency.

2. Why can a delivery workflow legitimately return STOP?  
   A. AI is not capable of writing code. B. It avoids automating a low-value, unsafe or unsupported idea. C. It reduces the number of agents. D. STOP means CI failed.

3. Which statement best describes L4 bounded autonomy?  
   A. Every action is autonomous. B. The model can change its own permissions. C. Defined task classes run autonomously within enforced scope, gates and recovery. D. Humans are removed from accountability.

4. Which plane is responsible for retries, dependencies and workflow state?  
   A. Execution. B. Orchestration. C. User interface. D. Database schema.

5. Which is the strongest evidence that an implementation satisfies a requirement?  
   A. The implementation agent says it is done. B. The PR has many lines changed. C. Relevant independent checks and evidence mapped to approved acceptance criteria. D. The model reports high confidence.

6. Why should the coding agent not be the only reviewer?  
   A. It cannot read code. B. The same mistaken interpretation can affect both implementation and self-review. C. Review always requires a different vendor. D. It makes the workflow slower.

7. Which metric is closest to a business outcome for the case study?  
   A. Tokens per agent. B. Generated lines of code. C. Subscription-management Support contacts normalized against active subscriptions. D. Number of prompts.

8. A system has green CI but customers paid for an upgrade and did not receive entitlements. What is the correct conclusion?  
   A. Delivery succeeded. B. Deployment success proves business success. C. Technical checks missed a business invariant; stop expansion and investigate. D. Increase traffic to gather more data.

9. Why is a separate agent not always necessary for every lifecycle stage?  
   A. Agents are prohibited from collaborating. B. Deterministic tools or one agent may perform the task more reliably and cheaply. C. More agents always reduce quality. D. Orchestration is unnecessary.

10. What does “GO for Discovery” authorize?  
    A. Production deployment. B. Implementation and merge. C. The next discovery stage only, subject to its own gates. D. Any action the agent considers useful.

### Answer key and explanations

1. **B** — Intent must be understood before selecting a solution.  
2. **B** — The workflow should be able to recommend no build or request clarification.  
3. **C** — L4 is constrained autonomy with enforceable controls and recovery.  
4. **B** — Orchestration controls sequencing, state and failure handling.  
5. **C** — Claims need independent, requirement-linked evidence.  
6. **B** — Shared assumptions create correlated errors; independent review challenges them.  
7. **C** — It measures the intended customer/support outcome, with normalization.  
8. **C** — A paid upgrade without entitlements violates a critical invariant.  
9. **B** — Use agents where specialization or context isolation adds value.  
10. **C** — Approval is stage-specific, not blanket authorization.
