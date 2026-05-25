# Developer

The developer worktree agents are where day-to-day code changes happen.

Purpose:

- Keep a persistent company organization (direction/engineering/operations/support/outreach/analytics) stable over time.
- Let developers come and go as local git worktrees without disrupting the team structure.

Operating rules:

- Do implementation work inside your git worktree directory under worktrees/.
- Prefer small, reviewable changes.
- Use aweb mail for non-blocking handoffs and review requests.
- Use aweb chat only when someone is waiting on a synchronous answer.

Adding more developers later:

- Use aw workspace add-worktree to add additional local worktree workspaces for the same repo.
