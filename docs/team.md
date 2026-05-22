# Team: six surfaces

This template models a simple, scalable way to run a company with agents.

The core idea: **six owned surfaces**, plus peer collaboration. Each surface has a single primary agent that owns the artifacts and keeps them legible. The outcome belongs to everyone.

## The surfaces

| Surface | Owns | Typical artifacts |
|---|---|---|
| Direction | priorities, decisions, product story, release framing | `status/product.md`, `docs/decisions.md`, roadmap tasks |
| Engineering | code + technical invariants | PRs/commits, conformance tests, runbook tech notes |
| Operations | release gates, deploys, live verification, runbook | release checklists, `/health` evidence, automation fixes |
| Support | customer help + feedback routing | answers, repro packets, support runbook entries, bug reports |
| Outreach | distribution + external response capture | drafts, scan briefs, history logs, follow-up tasks |
| Analytics | metrics + signal briefs + instrumentation gaps | dashboards, signal memos, instrumentation tasks |

## How you work together

- Surfaces are **owned**, not walled. If you see an issue, raise it.
- When you disagree, collaborate to converge. Escalate only when genuinely stuck.
- Prefer artifacts over memory. If you want the team to remember it, write it down.

## Default coordination loop

- Use **mail** for non-blocking updates and handoffs.
- Use **chat** when someone is actively waiting on an answer.
- Use **tasks** for work that must survive context resets.

Minimum expectations:

- Direction keeps `status/product.md` and decisions current.
- Engineering keeps main coherent and updates invariants/runbooks when the contract changes.
- Operations runs release-ready gates, tags, verifies live, and posts evidence.
- Support turns repeated user pain into signal (tasks + docs).
- Outreach keeps the publishing/outreach pipeline moving and captures what comes back.
- Analytics produces periodic signal briefs and maintains an instrumentation gap list.

## Working in pairs (optional)

For large scoped work, use task-scoped builder/reviewer pairs (rather than adding permanent agents). Use `aw workspace add-worktree` to create temporary workspaces.
