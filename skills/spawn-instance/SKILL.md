---
name: spawn-instance
description: Create or retire a concrete instance of a durable company-surface soul using explicit dashboard/init and git/filesystem steps.
---

# Spawn an instance of a soul

Use this only when a human asks or a documented workflow requires it. Do not
create identities or worktrees on your own initiative.

A soul lives in `souls/<role>/`. An instance is a concrete workspace with its own
`.aw` identity and optional git worktree. Keep instances local:

```bash
printf '/instances/\n' >> .git/info/exclude
```

## Surface instance

Do not replace a project-root `AGENTS.md`; many repos already use one. Create a
local instance instead:

```bash
role=direction
cd /path/to/project
mkdir -p "instances/$role"
cd "instances/$role"
ln -sfn "../../souls/$role/AGENTS.md" AGENTS.md
ln -sfn ../.. work

# Run the dashboard-generated aw init/connect command here for the chosen alias.
```

Add harness-specific links deliberately, for example `ln -sfn AGENTS.md
CLAUDE.md` for Claude Code.

## Developer worktree instance

Commit or stash current project changes before adding a git worktree.

```bash
role=developer
name=dev-task-123
cd /path/to/project
git worktree add "instances/$name" -b "$name"
cd "instances/$name"
ln -sfn "../../souls/$role/AGENTS.md" AGENTS.md

# Run the dashboard-generated aw init/connect command here for alias $name.
```

## Retire

Preserve useful branch/soul changes first. Revoke/remove the team membership
through the team's admin flow, then remove the explicit worktree or instance
directory.
