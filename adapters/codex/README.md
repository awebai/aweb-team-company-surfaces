# Codex adapter

Use the same explicit instance layout as other harnesses: the instance home
holds `AGENTS.md` (symlinked to the soul), which Codex reads natively.
Connect the instance with the dashboard-generated `aw init` command, then
launch Codex from the instance home.

Codex reads skills from `.agents/skills`, which is where the blueprint
installs them — no extra link needed.

This blueprint's developer soul declares `runtime: codex` by default; the
surface souls default to Claude Code. Both are hints, not requirements.

Do not copy `.aw` state between instances.
