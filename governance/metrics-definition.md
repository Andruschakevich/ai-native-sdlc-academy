# AI-Native SDLC Metrics

## Flow
- Request-to-production lead time: accepted request to production availability; define exact start/end events.
- Task-taken-to-production time: ready task accepted by engineer/agent to production; do not confuse with idea-to-production.
- Deployment frequency: successful production deployments per period.
- Work item throughput: accepted work completed per period.

## Quality and stability
- Change failure rate: production changes causing rollback, hotfix, incident or defined degradation divided by total changes.
- Recovery time: detection to service restoration.
- Escaped defects: post-release defects by severity.
- Rework rate: effort correcting work rejected by verification or users.

## Business outcome
- Subscription Support contacts per active subscription.
- Eligible self-service completion rate.
- Successful operations without Support.
- Median time to complete a management operation.
- Billing complaints, refunds and churn after plan changes.

## AI economics and autonomy
- Cost per accepted change: model/tool/compute cost per accepted outcome.
- Human review effort per accepted change.
- Agent task success rate by work type.
- Escalation and retry rate.
- Autonomy level by workflow and action class.

## Measurement rules
1. Establish baseline and sample size before pilot.
2. Normalize business metrics by active users/subscriptions where appropriate.
3. Pair speed with quality, safety and business guardrails.
4. Track model, prompt, tool and workflow versions.
5. Do not attribute business impact to AI without a defensible comparison.
6. Treat targets as hypotheses until measured.