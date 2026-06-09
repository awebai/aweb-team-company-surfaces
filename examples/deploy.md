# Deploy this operating pattern

This is an explicit, reviewable deployment. It does not create `.aw` state,
identities, worktrees, or branches for you.

Assumption: you already have a git repo or directory for your project.

## 0. Agent-first setup prompt

The intended use is that you point your agent at this pattern repo:

> Use `https://github.com/awebai/aweb-team-company-surfaces` as the team
> operating pattern for this repo. Read its `AGENTS.md` and
> `skills/bootstrapping-a-team/SKILL.md`. Set up the direction surface first
> using explicit aweb/dashboard init steps; do not create developer worktrees
> until I ask.

The remaining steps are the procedure the applying agent should follow.

## 1. Install resources into your project

```bash
git clone https://github.com/awebai/aweb-team-company-surfaces.git
./aweb-team-company-surfaces/scripts/install-local.sh /path/to/your/project
cd /path/to/your/project
```

Review the copied files before committing them:

```bash
git status --short
find souls team-operating-patterns/company-surfaces .agents/skills -maxdepth 3 -type f | sort
```

The install step should create identity-free pattern resources only. It should
not create `.aw`, `instances/`, git branches, or git worktrees. An agent may use
`scripts/install-local.sh` for this copy after confirming it will not overwrite
existing target paths.

## 2. Keep future instances local

Concrete instances are local workspaces, not pattern source. Ignore them locally:

```bash
printf '/instances/\n' >> .git/info/exclude
```

Use `.git/info/exclude` for the first setup so the helper does not silently edit
your project `.gitignore`. If your team wants `/instances/` to be a repo-wide
convention, you can later add it to `.gitignore` deliberately in a normal commit.

## 3. Commit the reusable pattern resources

Commit only reviewable, identity-free files:

```bash
git add souls .agents/skills team-operating-patterns/company-surfaces
git commit -m "Add company surfaces operating pattern"
```

Never commit `.aw`, invite tokens, private keys, generated certificates, or local
instance/worktree directories.

## 4. Create your first concrete instance

Usually create one surface first, such as direction:

```bash
mkdir -p instances/direction
cd instances/direction
ln -sfn ../../souls/direction/AGENTS.md AGENTS.md
ln -sfn ../.. work
```

Do not link a soul into the project root as `AGENTS.md` unless the human
explicitly wants that and the file does not already have project meaning.

## 5. Connect the instance to aweb

Use the dashboard for hosted setup. Create a team or choose an existing one, then
use the dashboard's connect-agent flow for the instance.

The dashboard will print a released-safe command shaped like:

```bash
AWEB_API_KEY=... AWEB_URL=... aw init ...
```

Run that exact command from the instance directory. Do not commit the generated
`.aw` directory.

## 6. Publish shared instructions and roles

From the project root after at least one workspace is connected:

```bash
cd ../..
aw instructions set --body-file team-operating-patterns/company-surfaces/instructions.md
aw roles set --bundle-file team-operating-patterns/company-surfaces/roles-bundle.json
aw roles show --all-roles
```

The Markdown role sources are also copied for review at:

```text
team-operating-patterns/company-surfaces/roles/
```

## 7. Add developer instances later

Create them only when needed. See [create-instance.md](create-instance.md).
