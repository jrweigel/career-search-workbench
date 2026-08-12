# network - Networking Intelligence Workflow

Use `network` when the candidate needs to decide who to contact first, where warm paths exist, or how to run follow-ups systematically.

## Purpose

Create a prioritized networking pipeline that is evidence-based and realistic.

## Inputs

Required:

- Target companies or role cluster

Optional:

- Existing contact list
- Time capacity per week
- Preferred channel (LinkedIn, email, referrals)

## Sequence

1. Gather target scope:
   - target companies
   - target role level
2. Build contact inventory:
   - warm (worked together)
   - warm-cold (shared context, weak relationship)
   - cold
3. Score contact priority with simple weights:
   - relationship strength
   - relevance to role
   - decision proximity
   - response likelihood
4. Build next-action queue:
   - first outreach date
   - follow-up date
   - touch count
   - message goal
5. Identify gaps:
   - no warm path at high-priority companies
   - no follow-up cadence
6. Apply follow-up cadence rules:
   - first follow-up due 5 to 7 days after an unanswered first touch
   - second follow-up due 7 to 10 days after the first follow-up when the target remains high value
   - default max touches: 3 before archive or quiet period
   - honor explicit declines or timing deferrals with a longer quiet period instead of repeated nudges
   - escalate channels only when the ask is still justified and the target remains a priority
7. Recommend the next command:
   - `outreach` when message crafting is the bottleneck
   - `linkedin` when profile quality blocks outreach confidence
   - `status` when pipeline actions need operational cleanup

## Follow-Up Cadence Rules

Use a simple outreach state model for each active target:

1. `Ready for first touch`
2. `Waiting after touch 1`
3. `Follow-up 1 due`
4. `Waiting after touch 2`
5. `Follow-up 2 due`
6. `Archive or quiet period`

Cadence guidance:

- Keep touch count visible.
- Do not let high-priority outreach sit untouched beyond 14 days without a deliberate decision.
- If the candidate has no capacity for more follow-up, say so directly and shrink the active list.
- If a company is already in `Interviewing`, networking follow-up should support interview progress, not create redundant outreach noise.

## Output Schema

```markdown
## Networking Intelligence Map
- Date:
- Target scope:

## Priority Contacts
| Priority | Name | Company | Relationship Stage | Goal | Touches | Next Action | Due |
|---|---|---|---|---|---|---|---|
| 1 |  |  | warm | informational chat | 0 | send first note | YYYY-MM-DD |

## Coverage Gaps
- [company] has no warm path
- [company] has stale follow-up older than 14 days

## Follow-Up Queue
| Company | Contact | Status | Last Touch | Follow-Up Due | Escalation |
|---|---|---|---|---|---|
|  |  | Waiting after touch 1 | YYYY-MM-DD | YYYY-MM-DD | stay on LinkedIn |

## This Week Plan
1. [action]
2. [action]
3. [action]

## Recommended Next
**Recommended next**: `outreach` - Draft the first two high-priority messages. **Alternatives**: `linkedin`, `status`
```

## State Integration

Write summary fields to `coaching_state.md` under Networking Intelligence.

Also maintain an Outreach Pipeline table in `coaching_state.md` for active networking motion:

```markdown
## Outreach Pipeline
| Company | Contact | Channel | Status | Touch Count | Last Touch | Follow-Up Due | Notes |
|---|---|---|---|---|---|---|---|
```

If `applications/tracker.md` exists, add networking tasks as next actions linked to the target company rows.
