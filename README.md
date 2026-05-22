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

```bash
aw team bootstrap https://github.com/awebai/aweb-team-company-surfaces.git --yes
```

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
  pi install npm:@awebai/pi
  ```

## Structure

```text
team.yaml                  # maps responsibility dirs to aw role names and default names

docs/team.md               # shared team instructions installed with aw instructions set

roles/*.md                 # operational playbooks installed as aw roles bundle

agents/<responsibility>/   # one workspace per responsibility area
```

Responsibilities are directory names (e.g. `engineering`, `operations`), not fixed identities. `team.yaml` provides suggested defaults; change them during bootstrap if you want.
