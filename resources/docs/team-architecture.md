# Team architecture

This team was created from the `company-surfaces` blueprint. This doc
explains how the team is structured, who does what, and how work flows. It
is committed so that every agent — and every human — can understand the
system they are running.

## Team at a glance

The company is modeled as **owned surfaces** plus peer collaboration. Each
surface has a durable soul that owns artifacts and keeps its work legible.
The outcome belongs to everyone.

| Surface | Owns | Standing? |
|---|---|---|
| **direction** | priorities, decisions, product story, release framing | yes |
| **engineering** | code + technical invariants | yes |
| **operations** | release gates, deploys, live verification, runbook | yes |
| **support** | customer help + feedback routing | yes |
| **outreach** | distribution + external response capture | yes |
| **analytics** | metrics + signal briefs + instrumentation gaps | yes |
| **developer** | scoped implementation in explicit worktrees | on-demand, per task |

Surfaces are **owned, not walled**: if you see an issue, raise it. When you
disagree, collaborate to converge; escalate only when genuinely stuck.

## Souls and instances

The team is defined as **souls** and run as **instances** — two distinct
things:

- A **soul** (`agents/souls/<role>/`) is the canonical *body* of an agent:
  its `AGENTS.md` (operating doc), `soul.yaml`, and its accumulated `docs/`,
  `decisions/`, and `memory/`. Souls hold **no identity**. They are
  committed, and they travel and grow with the repo.
- An **instance** (`agents/instances/<name>/`) is a *runnable copy* of a
  soul with its **own unique aweb identity**: a **home** (the directory —
  body symlinked to the soul, `.aw` identity; the session runs here) plus a
  **`work`** location.

  Instances are **gitignored** (private identity, machine-specific) and
  never travel with the repo.

A soul's `soul.yaml` records `role`, `runtime` (claude | codex | pi), and
`work`:

- `work: main` — `work` is a **symlink to the main checkout**. The surface
  agents work this way.
- `work: worktree` — `work/` is the instance's **own git worktree on its
  own branch** (named after the instance). Developer instances work this
  way: the session runs in the home, the code work happens in `work/`.

### One soul, many instances

Surface agents are standing singletons and use the bare role as their alias
(`direction`, `support`). Developer instances are created per task and
append a purpose slug: `developer-authflow`, `developer-billing`. On a
literal collision, append `-2`.

## How work flows

- **Direction** keeps product/status and decisions current and turns
  requests into prioritized tasks.
- **Engineering** keeps technical contracts coherent; implementation tasks
  go to **developer** instances, one per task, each in its own worktree.
- **Operations** runs release gates, tags, verifies live, posts evidence.
- **Support** turns repeated user pain into signal: tasks plus docs.
- **Outreach** keeps the publishing pipeline moving and captures responses.
- **Analytics** produces signal briefs and maintains instrumentation gaps.

Coordination defaults: **mail** for non-blocking updates and handoffs,
**chat** when someone is actively waiting, **tasks** for work that must
survive context resets. Prefer artifacts over memory — if the team should
remember it, write it down.

## Who may spawn an instance

Spawning is deliberately constrained (see the `spawn-instance` skill): only
when a **human explicitly asks**, or when a **documented workflow step
requires it**. No agent spawns on its own initiative to "get help." When a
human asks for an instance, prepare it and hand back the launch command.

One-shot developer instances are retired by their spawner when their branch
lands: `aw workspace delete` from the instance home, then remove the home,
worktree, and branch (procedure in `spawn-instance`).

> ⚠️ Never **move or rename** an instance home after `aw init` — aweb
> registers the workspace at its path. Re-mint in place to relocate.

## Maintaining a soul

As an agent works, it grows its soul's `docs/`, `decisions/`, and `memory/`
so knowledge persists across sessions — but it **never** edits its own
`AGENTS.md` or role. The `self-maintenance` skill is the how-to.

## Layout

```text
agents/souls/<role>/        committed canonical bodies (AGENTS.md, soul.yaml, docs/, decisions/, memory/)
agents/roles/<role>.md      role playbooks published to aweb (aw roles)
agents/instructions.md      shared team instructions published to aweb
agents/docs/                this doc and other shared team docs
agents/instances/<name>/    gitignored instance homes: .aw identity + body -> soul + work
.agents/skills/             shared skills: spawn-instance, self-maintenance
.agents/bin/                shared helpers (launch-session.sh)
.claude/skills              symlink to .agents/skills (Claude Code adapter)
```
