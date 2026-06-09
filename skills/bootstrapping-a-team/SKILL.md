---
name: bootstrapping-a-team
description: Use this when a human points you at this repository and asks you to bootstrap a company-surfaces aweb team in a repo or directory they own.
---

# Bootstrapping a company-surfaces team

You are bootstrapping a team from a **source pattern** into a human's target repo
or directory. The source pattern gives you souls, roles, skills, playbooks, and
adapter notes. You create concrete team instances with explicit aweb primitives
and explicit filesystem/git steps.

## Hard boundaries

Do not:

- create `.aw` state in this source-pattern repo;
- copy `.aw`, private keys, certificates, invite tokens, DIDs, or aliases from
  anywhere;
- overwrite existing target instructions, `.aw`, `souls/`, `.agents/skills/`, or
  `team-operating-patterns/` paths without asking;
- create git worktrees or branches unless the human asked for that concrete
  instance;
- use a monolithic bootstrap/provision command as the product path.

## 1. Confirm the setup inputs

Ask or infer, then repeat back before mutating files:

- target repo/directory path;
- whether the target is a git repo;
- team source: existing hosted team, new dashboard team, BYOT/admin setup, or
  already-connected workspace;
- first concrete surfaces to create now, usually direction/coordinator-like
  surface first rather than all surfaces at once;
- harness for each instance: Claude Code, Codex, Pi, or other;
- whether `/instances/` should be local-only via `.git/info/exclude` or committed
  as a repo `.gitignore` convention.

## 2. Inspect the pattern

Read:

```text
resource-pack.yaml
resources/instructions.md
resources/roles/*.md
resources/souls/*/soul.yaml
resources/souls/*/AGENTS.md
adapters/<harness>/README.md
```

Use `soul.yaml` only as an identity-free hint for role, work mode, and runtime.

## 3. Install identity-free resources in the target

Default target shape:

```text
souls/<surface>/...
.agents/skills/<skill>/...
team-operating-patterns/company-surfaces/
  instructions.md
  roles/<role>.md
  roles-bundle.json
  resource-pack.yaml
```

You may use `scripts/install-local.sh <target>` after checking it will not
overwrite target paths. The helper only copies identity-free resources and builds
a roles bundle. It must not create `.aw`, instances, branches, or worktrees.

In a git repo, commit reusable pattern resources, not concrete instances:

```bash
git add souls .agents/skills team-operating-patterns/company-surfaces
git commit -m "Add company surfaces operating pattern"
```

## 4. Keep concrete instances separate

Concrete instances are local workspaces with their own `.aw` state. For a git
target, keep them local unless the human chooses a different policy:

```bash
printf '/instances/\n' >> .git/info/exclude
```

## 5. Create first surface instances explicitly

Create only the surfaces the human wants active now. For direction in the main
checkout context:

```bash
cd <target>
mkdir -p instances/direction
cd instances/direction
ln -sfn ../../souls/direction/AGENTS.md AGENTS.md
ln -sfn ../.. work
```

Add harness-specific links only after choosing the harness, for example Claude
Code:

```bash
ln -sfn AGENTS.md CLAUDE.md
```

For developer work, create a git worktree instance only when there is a concrete
implementation task:

```bash
cd <target>
git worktree add instances/dev-task-123 -b dev-task-123
cd instances/dev-task-123
ln -sfn ../../souls/developer/AGENTS.md AGENTS.md
```

## 6. Connect with aweb primitives

Hosted, released-safe path: ask the human to create or choose the team in the
dashboard and use the dashboard's connect-agent flow. Run the generated command
from the concrete instance directory it should bind:

```bash
AWEB_API_KEY=... AWEB_URL=... aw init ...
```

Verify from the instance directory:

```bash
aw workspace status
aw mail inbox
```

## 7. Publish shared team context

After at least one workspace is connected, publish from a connected workspace in
or under the target repo:

```bash
aw instructions set --body-file team-operating-patterns/company-surfaces/instructions.md
aw roles set --bundle-file team-operating-patterns/company-surfaces/roles-bundle.json
aw roles show --all-roles
```

## Done criteria

You are done when:

- the target has committed, identity-free souls/roles/skills/pattern resources;
- concrete instance directories are local-only or handled according to the
  human's explicit policy;
- requested first instances are connected to aweb;
- instructions and roles are published to the team;
- the human has the exact command/path to start each instance.
