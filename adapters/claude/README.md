# Claude Code adapter

Claude Code commonly reads `AGENTS.md` and/or `CLAUDE.md` from the workspace.
After creating an instance explicitly, link the chosen soul.

For a developer worktree instance:

```bash
ln -sfn ../../souls/developer/AGENTS.md AGENTS.md
ln -sfn AGENTS.md CLAUDE.md
```

For a surface instance such as direction:

```bash
mkdir -p instances/direction
cd instances/direction
ln -sfn ../../souls/direction/AGENTS.md AGENTS.md
ln -sfn AGENTS.md CLAUDE.md
ln -sfn ../.. work
```

Do not overwrite a project-root `AGENTS.md` just to start Claude Code; create an
instance directory instead.
