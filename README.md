# Aweb team template: company six-surface team

A canonical multi-agent template for running a company with AI agents, modeled after `ai.aweb`.

This template is meant to be used with the `aw` CLI.

## Install `aw`

```bash
npm install -g @awebai/aw
aw version
```

## Bootstrap

Run from the root of the project git repo where the company agents should work.

This template models a stable company org (six persistent “surface” agents) plus at least one developer worktree agent for code changes.

### Recommended: repo-local agents layout

```bash
aw agents bootstrap https://github.com/awebai/aweb-team-company-surfaces.git \
  --username <username> \
  --identity-prefix <you>
```

If you want hosted onboarding prompts, omit `--username`. If your team already
exists, ask a teammate for an invite and run:

```bash
aw agents provision --invite-token <token> --identity-prefix <you>
```

Bootstrap allocates per-human aliases from `--identity-prefix` and the naming
policy in `team.yaml`. The committed template stays identity-free.

Bootstrap creates `./agents/` in the project repo and provisions one home per
responsibility under:

- `agents/home/direction/`
- `agents/home/engineering/`
- `agents/home/operations/`
- `agents/home/support/`
- `agents/home/outreach/`
- `agents/home/analytics/`
- `agents/home/developer/`

The developer responsibility also gets an isolated git worktree under
`agents/worktrees/developer/`.

Then start your agents:

```bash
cd agents/home/direction
claude

cd ../engineering
claude

cd ../developer
codex
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

- `aweb-bootstrap` — choose the right team source, repo-local layout, worktree-agent policy, and rerun safety.
- `aweb-coordination` — day-to-day work loop, claims, handoffs, and shared state.
- `aweb-messaging` — mail/chat response policy and wake-up events.
- `aweb-team-membership` — invites, active team, certificates, hosted vs BYOT, and addressability.
- `aweb-identity` — identity, custody, `did:key`/`did:aw`, key rotation, and inbound mode.

Other maintained templates:

- [`aweb-team-coord-worktrees`](https://github.com/awebai/aweb-team-coord-worktrees) — one coordinator plus developer/reviewer worktree agents.

## Structure

```text
team.yaml                  # maps responsibilities to roles, identity scope, home_template, and work binding

docs/team.md               # shared team instructions installed with aw instructions set

roles/*.md                 # operational playbooks installed as aw roles bundle

home/<responsibility>/     # source template for each generated agent home
```

Responsibilities are directory names (e.g. `engineering`, `operations`), not
fixed identities. `team.yaml` stays identity-free; final aliases and addresses
are planned per human from `--identity-prefix` and the naming policy.

Developer worktree agents are intentionally separate from the persistent org:

- The org stays stable over time.
- Developers come and go as local worktrees.
- Code edits happen in `agents/worktrees/` so agents do not step on the shared checkout.

After a one-command bootstrap (hosted or BYOT auto-provision), you should see developer worktree agent directories like:

- `agents/worktrees/developer/`

That is where code changes should be made. The six persistent surface homes in
`agents/home/` each get a `work` symlink for visibility and context, but the
worktree agents are the isolation boundary for parallel code edits.

## License

This template is open source under the [MIT License](./LICENSE).
