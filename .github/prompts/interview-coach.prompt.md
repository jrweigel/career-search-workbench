---
agent: ask
description: Start Interview Coach workflow (SKILL.md + command routing)
---
Use `SKILL.md` as the primary instruction source for this session.

Then:
1. Load `coaching_state.md` if it exists.
2. If no command was provided, ask whether to run `kickoff` or `help`.
3. If a command was provided, execute it using `references/commands/[command].md` and related routed files defined in `SKILL.md`.
