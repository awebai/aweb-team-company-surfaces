# Create a team from this blueprint

This is an explicit, reviewable setup. Nothing here creates `.aw` state,
identities, worktrees, or branches behind your back.

Assumption: you have a git repo for your project.

## 0. Agent-first prompt

The intended use is that you point your agent at this blueprint:

> Use `https://github.com/awebai/aweb-team-company-surfaces` as the
> blueprint for this repo. Read its `AGENTS.md` and follow
> `skills/create-team/SKILL.md`. Set up the direction surface first using
> explicit aweb/dashboard init steps; do not create the other instances
> until I ask.

The remaining steps are the procedure the agent follows — they work the same
if you run them yourself.

## 1. Install the resources into your repo

```bash
git clone https://github.com/awebai/aweb-team-company-surfaces.git
./aweb-team-company-surfaces/scripts/install-local.sh /path/to/your/project
cd /path/to/your/project
```

Review the copied files:

```bash
git status --short
find agents .agents -type f | sort
```

The install copies identity-free team resources only — souls, roles,
instructions, docs, skills, and the launch helper. It does not create `.aw`,
instances, branches, or worktrees. The blueprint clone itself is disposable
after this step.

## 2. Keep instances out of git, commit the rest

Instances carry private identity and are machine-specific. Append to your
`.gitignore`:

```text
/agents/instances/
```

Then commit the team resources:

```bash
git add agents .agents .gitignore
git commit -m "Add company-surfaces team from blueprint"
```

For Claude Code, also link the skills dir before committing:

```bash
ln -sfn .agents/skills .claude/skills
git add .claude
```

Never commit `.aw`, invite tokens, private keys, certificates, or instance
directories.

## 3. Create your first instance: direction

```bash
mkdir -p agents/instances/direction
cd agents/instances/direction
ln -sfn ../../souls/direction/AGENTS.md AGENTS.md
ln -sfn ../../.. work
ln -sfn AGENTS.md CLAUDE.md   # only if using Claude Code
```

Do **not** link a soul into the project root as `AGENTS.md`; many repos
already use that file for their own instructions.

## 4. Connect direction to aweb

Use the dashboard for hosted setup: create a team or choose an existing one,
then use the dashboard's connect-agent flow. It prints a command shaped
like:

```bash
AWEB_API_KEY=... AWEB_URL=... aw init ...
```

Run that exact command from `agents/instances/direction/`. Do not commit the
generated `.aw` directory. Verify:

```bash
aw workspace status
aw whoami
```

## 5. Publish shared instructions and roles

From the connected direction home:

```bash
aw instructions set --body-file ../../instructions.md
aw roles set --bundle-file ../../roles-bundle.json
aw roles show --all-roles
```

Where the installed CLI supports it, you can publish one role at a time
instead: `aw roles add support --title "Support" --playbook-file
../../roles/support.md`.

## 6. Start direction

```bash
cd agents/instances/direction
claude
```

If you use Pi, Codex, or another harness, see `adapters/` and adapt the
launch command. The identity/workspace setup stays explicit either way.

## 7. Grow the team later

Connect the other surfaces (engineering, operations, support, outreach,
analytics) the same way as you need them, and let the team spawn developer
instances when work needs them, using the `spawn-instance` skill installed
at `.agents/skills/spawn-instance/`. See
[create-instance.md](create-instance.md).
