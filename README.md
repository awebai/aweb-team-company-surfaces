# Company surfaces team operating pattern

This repository is a deployable **team operating pattern** for running a company
with AI agents. It is designed for the normal use case where a human points their
coding agent at this repo and says:

> Set up my repo with a team patterned after this sample.

The applying agent reads the souls, roles, skills, and playbooks here, then uses
explicit aweb primitives plus explicit filesystem/git steps in the human's target
repo or directory.

Choose this pattern when you want durable agents organized by customer/company
surface:

- direction;
- engineering;
- operations;
- support;
- outreach;
- analytics;
- task-scoped developer instances for code changes.

The pattern gives you **souls, roles, skills, playbooks, and adapter notes**. You
then explicitly create concrete instances when you need them.

## What this repo contains

```text
AGENTS.md                      Instructions for an agent applying this pattern
resource-pack.yaml             Manifest for the operating pattern
resources/instructions.md      Team-wide operating instructions
resources/roles/*.md           Role playbooks for aweb roles
resources/souls/*              Durable agent bodies: soul.yaml + AGENTS.md + memory dirs
skills/bootstrapping-a-team    Agent-facing procedure for bootstrapping a team
skills/*                       Reusable procedures target agents may load
examples/deploy.md             How to install the pattern into your project
examples/create-instance.md    How to create one concrete agent instance
adapters/*                     Harness notes for Claude Code, Codex, and Pi
scripts/install-local.sh       Explicit filesystem install helper; no .aw mutation
scripts/build-roles-bundle.py  Builds a roles JSON bundle from Markdown roles
```

## Important boundary

This repo does **not** contain `.aw`, private keys, DIDs, certificates, aliases,
team IDs, invite tokens, generated worktrees, or generated instance directories.
It does not create identities or git worktrees behind your back.

## Agent-first use

In your own repo or directory, tell your agent something like:

> Use `https://github.com/awebai/aweb-team-company-surfaces` as the team
> operating pattern for this repo. Read its `AGENTS.md`, load its
> `skills/bootstrapping-a-team/SKILL.md`, and set up the direction surface first.
> Do not create developer worktrees until I ask.

The agent should:

1. inspect `resource-pack.yaml`;
2. copy only identity-free souls, roles, instructions, and skills into your repo;
3. create concrete instance directories explicitly;
4. connect each instance with aweb primitives, usually the dashboard-generated
   `AWEB_API_KEY=... AWEB_URL=... aw init ...` command;
5. publish instructions and roles after a workspace is connected.

If you are doing the filesystem copy yourself, run:

```bash
git clone https://github.com/awebai/aweb-team-company-surfaces.git
./aweb-team-company-surfaces/scripts/install-local.sh /path/to/your/project
cd /path/to/your/project
```

## What gets copied into your project

```text
/path/to/your/project/
  souls/direction/
  souls/engineering/
  souls/operations/
  souls/support/
  souls/outreach/
  souls/analytics/
  souls/developer/
  .agents/skills/bootstrapping-a-team/
  .agents/skills/self-maintenance/
  .agents/skills/spawn-instance/
  team-operating-patterns/company-surfaces/
    instructions.md
    roles/
      analytics.md
      developer.md
      direction.md
      engineering.md
      operations.md
      outreach.md
      support.md
    roles-bundle.json
    resource-pack.yaml
```

Then connect/publish with released aweb flows:

1. Create or choose your team in the dashboard.
2. From each workspace/instance directory, run the exact dashboard-generated
   `AWEB_API_KEY=... AWEB_URL=... aw init ...` command for that agent.
3. Publish shared context from the project root:

   ```bash
   aw instructions set --body-file team-operating-patterns/company-surfaces/instructions.md
   aw roles set --bundle-file team-operating-patterns/company-surfaces/roles-bundle.json
   aw roles show --all-roles
   ```

See [examples/deploy.md](examples/deploy.md) for the full flow.

## Create instances explicitly

Create concrete agent instances only when needed. For a task-scoped developer:

```bash
git worktree add instances/dev-task-123 -b dev-task-123
cd instances/dev-task-123
ln -sfn ../../souls/developer/AGENTS.md AGENTS.md
# Run the dashboard-generated aw init/connect command for alias dev-task-123.
```

See [examples/create-instance.md](examples/create-instance.md).

## Legacy note

The old version of this repository was input for a monolithic setup command.
That path is obsolete/legacy compatibility. This repository is now a
resource-pack/team-operating-pattern source: copy/publish resources deliberately,
then create identities and worktrees explicitly.

## License

MIT. Fork freely and adapt the pattern to your team.
