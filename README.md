# Aweb team template: company six-surface team

A canonical multi-agent template for running a company with AI agents, modeled after `ai.aweb`.

This template is meant to be used with the `aw` CLI.

## Install `aw`

```bash
npm install -g @awebai/aw
aw version
```

## Bootstrap

Run from a directory that is **not already inside a git repo/worktree** (the command refuses to clone a template into an existing git worktree).

This template models a stable company org (six persistent “surface” agents) plus at least one developer worktree agent for code changes.

### Choose the work repo input (XOR)

You must pass exactly one of:

- `--work-directory <path>` (use an existing local directory)
- `--work-repo-url <url-or-local-path>` (bootstrap will git clone into `./worktrees/<derived-name>/` inside the template checkout)

Because this template declares worktree agents in `team.yaml`, the work directory must be a git repo.
### Recommended: clone the work repo into worktrees/

```bash
aw team bootstrap https://github.com/awebai/aweb-team-company-surfaces.git \
  --yes \
  --username <username> \
  --work-repo-url https://github.com/<org>/<repo>.git
```

### Alternative: use an existing local work directory

```bash
aw team bootstrap https://github.com/awebai/aweb-team-company-surfaces.git \
  --yes \
  --username <username> \
  --work-directory /path/to/your/repo
```

If you want hosted onboarding prompts, omit `--yes` and `--username`.
If you use `--yes`, provide an explicit team source such as `--username`,
`AWEB_API_KEY`, `--invite-token`, or `--namespace`/`--team`.

This clones `./aweb-team-company-surfaces/` and bootstraps one workspace per responsibility under:

- `aweb-team-company-surfaces/agents/direction/`
- `aweb-team-company-surfaces/agents/engineering/`
- `aweb-team-company-surfaces/agents/operations/`
- `aweb-team-company-surfaces/agents/support/`
- `aweb-team-company-surfaces/agents/outreach/`
- `aweb-team-company-surfaces/agents/analytics/`

Then start your agents:

```bash
cd aweb-team-company-surfaces/agents/direction
claude

cd ../engineering
claude
```

## Real-time awakenings for mail/chat (recommended)

By default, agents do not automatically wake up when they receive aweb mail/chat.

Without a wake-up path, you must ask them to check:

```bash
aw mail inbox
aw chat pending
```

Solutions:

- **Claude Code**: install the channel plugin from inside `claude`:
  ```
  /plugin marketplace add awebai/claude-plugins
  /plugin install aweb-channel@awebai-marketplace
  ```
  then restart with:
  ```bash
  claude --dangerously-load-development-channels plugin:aweb-channel@awebai-marketplace
  ```

- **Codex**:
  ```bash
  aw run codex
  ```

- **Pi**:
  ```bash
  pi install npm:@awebai/pi@latest
  ```

## Related skills and templates

If your coding agent supports aweb skills (for example through `@awebai/pi`), load these when useful:

- `aweb-bootstrap` — choose the right team source, work-directory/work-repo-url shape, worktree-agent policy, and rerun safety.
- `aweb-coordination` — day-to-day work loop, claims, handoffs, and shared state.
- `aweb-messaging` — mail/chat response policy and wake-up events.
- `aweb-team-membership` — invites, active team, certificates, hosted vs BYOT, and addressability.
- `aweb-identity` — identity, custody, `did:key`/`did:aw`, key rotation, and inbound mode.

Other maintained templates:

- [`aweb-team-dev-review`](https://github.com/awebai/aweb-team-dev-review) — minimal developer + reviewer pair.
- [`aweb-team-coord-worktrees`](https://github.com/awebai/aweb-team-coord-worktrees) — one coordinator plus developer/reviewer worktree agents.

## Structure

```text
team.yaml                  # maps responsibility dirs to aw role names and default names

docs/team.md               # shared team instructions installed with aw instructions set

roles/*.md                 # operational playbooks installed as aw roles bundle

agents/<responsibility>/   # one workspace per persistent responsibility area
worktrees/                 # git worktrees + local worktree agents (code changes)
```

Responsibilities are directory names (e.g. `engineering`, `operations`), not fixed identities. `team.yaml` provides suggested defaults; change them during bootstrap if you want.

Developer worktree agents are intentionally separate from the persistent org:

- The org stays stable over time.
- Developers come and go as local worktrees.
- Code edits happen in worktrees/ so agents do not step on the shared checkout.

After a one-command bootstrap (hosted or BYOT auto-provision), you should see developer worktree agent directories like:

- worktrees/<repo-name>-dev/

That is where code changes should be made. The six persistent surface workspaces in agents/ each get a work/ symlink for visibility and context, but the worktree agents are the isolation boundary for parallel code edits.

## License

This template is open source under the [MIT License](./LICENSE).
