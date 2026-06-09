# Company surfaces team

This team was created from the `company-surfaces` blueprint. It models a
company as owned surfaces plus peer collaboration. Each surface has a durable
soul that owns artifacts and keeps its work legible. The outcome belongs to
everyone. The full model is in `agents/docs/team-architecture.md`.

## The surfaces

| Surface | Owns | Typical artifacts |
|---|---|---|
| Direction | priorities, decisions, product story, release framing | `status/product.md`, `docs/decisions.md`, roadmap tasks |
| Engineering | code + technical invariants | PRs/commits, conformance tests, runbook tech notes |
| Operations | release gates, deploys, live verification, runbook | release checklists, `/health` evidence, automation fixes |
| Support | customer help + feedback routing | answers, repro packets, support runbook entries, bug reports |
| Outreach | distribution + external response capture | drafts, scan briefs, history logs, follow-up tasks |
| Analytics | metrics + signal briefs + instrumentation gaps | dashboards, signal memos, instrumentation tasks |
| Developer | scoped implementation in explicit worktrees | focused branches, test evidence, review handoffs |

## How you work together

- Surfaces are **owned**, not walled. If you see an issue, raise it.
- When you disagree, collaborate to converge. Escalate only when genuinely stuck.
- Prefer artifacts over memory. If you want the team to remember it, write it down.
- Keep identity state and generated workspaces separate from the pattern source.

## Default coordination loop

- Use **mail** for non-blocking updates and handoffs.
- Use **chat** when someone is actively waiting on an answer.
- Use **tasks** for work that must survive context resets.

Minimum expectations:

- Direction keeps product/status and decisions current.
- Engineering keeps technical contracts coherent and updates invariants/runbooks when the contract changes.
- Operations runs release-ready gates, tags, verifies live, and posts evidence.
- Support turns repeated user pain into signal: tasks plus docs.
- Outreach keeps the publishing/outreach pipeline moving and captures what comes back.
- Analytics produces periodic signal briefs and maintains an instrumentation gap list.
- Developer instances make scoped code changes in explicit git worktrees.

## Developer worktrees

This team keeps surface souls persistent, and puts code changes in explicit
developer instances/worktrees.

Why:

- Surface agents stay stable.
- Developers can come and go without changing the org model.
- Each developer works in an isolated git worktree to avoid collisions.

Create developer instances only when needed — on explicit human request or a
documented workflow step — using the `spawn-instance` skill in
`.agents/skills/`. Retire one-shot instances when their branch lands.

## Souls

- `agents/souls/<role>/` are the durable, committed agent bodies; they grow
  with the team (docs, decisions, memory) per the `self-maintenance` skill.
- Never edit your own AGENTS.md or role; those are human/review-owned.
- `agents/instances/<name>/` are gitignored runnable copies with their own
  identity. Do not overwrite another agent's workspace state or `.aw/`.
