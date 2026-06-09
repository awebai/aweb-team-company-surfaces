# Create a concrete instance

A soul is the durable body in `souls/<role>/`. An instance is a concrete
workspace with its own aweb identity and optional git worktree.

Create instances only when you need them. Keep them local with:

```bash
printf '/instances/\n' >> .git/info/exclude
```

## Surface instance

Surface agents such as direction, support, outreach, analytics, engineering, and
operations often work from a local instance directory pointing at the main
checkout.

```bash
cd /path/to/your/project
mkdir -p instances/direction
cd instances/direction
ln -sfn ../../souls/direction/AGENTS.md AGENTS.md
ln -sfn ../.. work

# Run the dashboard-generated aw init/connect command here for the chosen alias.
```

If your harness expects a different instruction filename, add that adapter link
explicitly, for example:

```bash
ln -sfn AGENTS.md CLAUDE.md
```

Use the soul matching the alias/responsibility you are connecting. Do not replace
a project-root `AGENTS.md` unless the human explicitly wants that.

## Developer worktree instance

Commit or stash your current project changes before adding a git worktree.

```bash
cd /path/to/your/project
git worktree add instances/dev-task-123 -b dev-task-123
cd instances/dev-task-123
ln -sfn ../../souls/developer/AGENTS.md AGENTS.md
ln -sfn AGENTS.md CLAUDE.md  # only if using Claude Code

# Run the dashboard-generated aw init/connect command here for alias dev-task-123.
```

## Clean up

Before deleting an instance, preserve useful branch/soul changes and revoke or
remove the team membership through the dashboard or your team's chosen admin
flow. Then remove the explicit worktree:

```bash
git worktree remove instances/dev-task-123
git branch -D dev-task-123  # only if the branch is no longer needed
```

For a non-worktree instance such as `instances/direction`, remove the directory
after preserving any useful local files and revoking/removing membership.
