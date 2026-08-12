# status - Pipeline and Learnings Snapshot

Use `status` when the candidate asks where they stand, what is overdue, or what to do next.

## Purpose

`status` is the operational control view. It reads pipeline artifacts and gives one clear recommendation.

## Inputs

Optional:

- Company filter (if the candidate asks for one company only)
- Time window override for stale checks
- Mode override: standard or weekly

Defaults:

- Stale tracker threshold: 7 days
- Stale learnings synthesis threshold: 14 days
- Overdue threshold: due date before today
- Missing-follow-up threshold: 14 days without a logged touch for active targets

## Data Sources

Read in this order:

1. `applications/tracker.md` (primary source of operational truth)
2. `applications/learnings/patterns.md` (synthesized lessons)
3. `applications/prep-briefs/active/` (active prep brief artifacts)
4. `coaching_state.md` (context and tie-breakers)

If tracker is missing, say so directly and suggest creating it.

## Sequence

1. Validate tracker availability.
2. Run tracker integrity checks before trusting the data:
   - required fields present for active rows: company, role, stage, next action, due date, last update
   - no duplicate company + role rows unless the notes clearly distinguish separate openings
   - due dates are valid and not clearly obsolete
   - last update dates are parseable and within the operational freshness threshold
   - interviewing, offer, or closed rows align with interview loops or outcome records in `coaching_state.md` when that data exists
   - networking-related next actions are visible for high-priority targets when the candidate is relying on outreach motion
3. Parse active rows and compute stage counts.
4. Detect overdue actions from due dates.
5. Flag stale records:
   - tracker last update older than threshold
   - learnings patterns older than threshold relative to newest note
   - prep briefs in active folder older than threshold and tied to upcoming rounds
   - personal brand canon freshness from coaching state
   - evidence index freshness from coaching state
   - networking follow-up older than threshold when the candidate has active outreach targets
6. Cross-check with coaching state context:
   - upcoming interviews
   - pending outcomes
   - active strategy bottlenecks
   - JD fit signals that affect where effort should go
7. If mode is `weekly`, aggregate movement across the last 7 days and the next 7 days:
   - stage movement and outcomes
   - follow-ups due
   - upcoming interviews or decision points
   - biggest operational risk
8. Recommend one highest-leverage next command.
9. Offer 2 alternatives.

## Tracker Integrity Rules

Treat these as operational checks, not stylistic preferences.

### Critical Issues

These should be surfaced before the normal summary because they make the rest of the snapshot less trustworthy.

- Missing `Next Action` on any non-closed row
- Missing `Due Date` on any non-closed row
- Duplicate company + role rows with no clear distinction in notes
- `Interviewing` row with no corresponding active interview loop when coaching state has company data
- `Offer` or `Closed` row with no matching outcome context when coaching state has outcome data

### Warning Issues

These do not block the summary, but they should lower confidence in the operating picture.

- `Last Update` older than the stale tracker threshold
- networking motion absent for a high-priority target the candidate says they want to pursue
- follow-up task appears stale relative to the missing-follow-up threshold
- prep brief appears active but no longer matches the current stage in the tracker

### Behavior When Issues Exist

- If critical issues exist, surface a `Data Quality Report` before the normal snapshot.
- If the candidate can confirm a factual correction, update the relevant artifact.
- If the candidate cannot confirm the correction, keep the issue visible and avoid false precision in recommendations.

## Weekly Mode

Use weekly mode when the candidate asks for a week-in-review, wants a control-tower view, or needs next-week prioritization rather than a point-in-time snapshot.

Weekly mode still runs the same integrity checks first. It does not override them.

### Weekly Focus

- what moved in the pipeline this week
- what is due or at risk next week
- where outreach is stale
- which opportunity deserves the most attention now

### Weekly Recommendation Logic

Use the standard recommendation logic, but bias toward the next 7 days:

1. any critical data-quality issue that would distort the weekly readout
2. interview or decision point within 7 days
3. stale follow-up on a high-priority target
4. unresolved evidence or positioning gap that blocks the next step
5. otherwise, the single highest-leverage move for the coming week

## Recommendation Logic

Use this order:

1. Critical tracker issue blocks trustworthy prioritization -> fix the operational record first
2. Overdue interview-prep action due within 48h -> `hype`
3. Upcoming interview but no prep entry -> `prep [company]`
4. Debrief exists, no transcript analysis -> `analyze`
5. Rejections accumulating without synthesis refresh -> `progress`
6. Tracker missing networking motion for key targets -> `network`
7. Otherwise -> most recent active bottleneck from `coaching_state.md`

## Output Schema

```markdown
## Status Snapshot
- Date:
- Scope: [all companies or filtered company]
- Mode: [standard]

## Data Quality Report
- Overall: [clear / warning / critical]
- Critical issues:
   1. [issue or none]
- Warning issues:
   1. [issue or none]

## Pipeline Counts
- Researching:
- Applied:
- Interviewing:
- Offer:
- Closed:

## Overdue Actions
1. [Company] - [Next action] - Due [date] - [days overdue]

## Freshness Checks
- Tracker freshness: [fresh / stale]
- Learnings synthesis freshness: [fresh / stale]
- Prep briefs freshness: [fresh / stale / none in active]
- Personal brand canon: [fresh / stale / not started]
- Evidence index: [fresh / stale / not started]
- Networking cadence: [on track / stale / not started]
- Data quality risks: [missing due dates, missing next actions, duplicate rows, loop mismatch]

## Signals That Matter Right Now
- [1-3 concise observations]

## Recommended Next
**Recommended next**: `[command]` - [one-line reason]. **Alternatives**: `[command]`, `[command]`
```

## Weekly Output Addendum

When mode is `weekly`, append this after the standard snapshot:

```markdown
## Weekly Control Tower
- Window: [past 7 days / next 7 days]
- Pipeline movement: [advances, closures, new targets, stalled items]
- Follow-ups due this week: [count and top items]
- Upcoming decision points: [1-3 items]
- Biggest operational risk: [single sentence]

## Priorities For The Next 7 Days
1. [highest-leverage action]
2. [second action]
3. [maintenance action]
```

## Write Behavior

`status` is read-first. Only write updates when the candidate confirms corrections.

If corrections are confirmed:

- Update the relevant row in `applications/tracker.md`
- Update `coaching_state.md` only when correction affects coaching decisions
