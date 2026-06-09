# Create a concrete instance

A soul is the durable body in `souls/<role>/`. An instance is a concrete
workspace with its own aweb identity and optional git worktree.

Create instances only when you need them.

## Surface instance in the main checkout

Surface agents such as direction, support, outreach, analytics, engineering, and
operations often work from the main checkout or from a durable home directory.
From the chosen workspace:

```bash
cd /path/to/your/project
# Run the dashboard-generated aw init/connect command for the chosen alias.
ln -sfn souls/direction/AGENTS.md AGENTS.md
ln -sfn AGENTS.md CLAUDE.md
```

Use the soul matching the alias/responsibility you are connecting.

## Developer worktree instance

```bash
cd /path/to/your/project
git worktree add instances/dev-task-123 -b dev-task-123
cd instances/dev-task-123

# Run the dashboard-generated aw init/connect command for alias dev-task-123.
ln -sfn ../../souls/developer/AGENTS.md AGENTS.md
ln -sfn AGENTS.md CLAUDE.md
```

## Clean up

Before deleting an instance, preserve useful branch/soul changes and revoke or
remove the team membership through the dashboard or your team's chosen admin
flow. Then remove the explicit worktree:

```bash
git worktree remove instances/dev-task-123
git branch -D dev-task-123  # only if the branch is no longer needed
```
