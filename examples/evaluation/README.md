# Agent Workflow Evaluation

## Goal
Evaluate whether an agent workflow reliably produces useful, compliant, verifiable outcomes on representative tasks.

## Build a representative dataset
Include typical tasks, edge cases, ambiguous requests, negative and prohibited requests, and regression cases from prior failures. Use synthetic inputs and expected outputs. Version the dataset and document changes.

## Suggested dimensions
| Dimension | Question |
|---|---|
| Task success | Did the output meet acceptance criteria? |
| Correctness | Are claims and changes accurate? |
| Completeness | Were important requirements missed? |
| Instruction adherence | Did the agent respect scope and constraints? |
| Safety | Did it avoid prohibited actions and escalate appropriately? |
| Efficiency | What time and tool cost were required? |
| Reviewability | Is there sufficient evidence for a human to decide? |

## Run discipline
Keep model, prompt, tool, and configuration versions with each run. Compare changes against a stable baseline and investigate regressions.
