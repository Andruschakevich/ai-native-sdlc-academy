# Dependency Graph

```mermaid
flowchart TD
  WP01[Discovery and contracts] --> WP02[Eligibility and authorization]
  WP01 --> WP03[Price and discount preview]
  WP01 --> WP04[Idempotent command model]
  WP02 --> WP05[Immediate upgrade]
  WP03 --> WP05
  WP04 --> WP05
  WP02 --> WP06[Scheduled downgrade and cycle]
  WP03 --> WP06
  WP04 --> WP06
  WP02 --> WP07[Cancel, pause, resume, reactivate]
  WP03 --> WP07
  WP04 --> WP07
  WP05 --> WP08[Entitlements and reconciliation]
  WP06 --> WP08
  WP07 --> WP08
  WP08 --> WP09[Audit, notifications, analytics]
  WP09 --> WP10[Independent verification]
  WP10 --> WP11[Progressive release]
```

Eligibility, preview and idempotency can proceed in parallel after discovery if contracts are stable. Shared files require explicit ownership or isolated workspaces. Verification inspects implementation evidence independently.