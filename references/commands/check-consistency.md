# check-consistency - Cross-Surface Alignment Audit

Use `check-consistency` when the candidate needs to confirm that resume, LinkedIn, pitch, and coaching-state narrative are aligned.

## Purpose

Find contradictions and narrative drift before they damage credibility with recruiters or interviewers.

## Inputs

Required:

- At least two surfaces to compare:
  - resume text
  - LinkedIn profile text
  - positioning statement (`pitch` output)
  - relevant state fields from `coaching_state.md`

Optional:

- Scope selector: `all` (default), `resume`, `linkedin`, `pitch`
- Priority target role for tie-break decisions

## Priority Check

Before running:

- If no kickoff has run, state that baseline comparison will be weaker.
- If interview is within 48 hours, keep output tactical and short.
- If only one surface is available, ask for at least one more source.

## Sequence

1. Assemble canonical baseline from coaching state:
   - target role and seniority
   - timeline and current-company context
   - core positioning language
2. Compare surface pairs:
   - Resume <-> LinkedIn
   - Resume <-> Pitch
   - LinkedIn <-> Pitch
3. Evaluate each pair on:
   - title and seniority alignment
   - timeline and date consistency
   - scope and ownership language
   - differentiation and message consistency
   - evidence strength and credibility
4. Classify each issue:
   - Red flag: direct contradiction
   - Yellow flag: soft misalignment or ambiguity
   - Green: aligned
5. Generate prioritized fix queue with smallest safe edits first.
6. Recommend next command based on highest-risk issues.

## Output Schema

```markdown
## Consistency Audit: [Scope]

## Alignment Score
- Overall: [Strong / Moderate / Fragile]
- Red flags: [#]
- Yellow flags: [#]

## Findings (ordered by risk)
| Severity | Surface Pair | Issue | Why It Matters | Fix |
|---|---|---|---|---|
| Red/Yellow | Resume <-> LinkedIn |  |  |  |

## Priority Fix Queue
1. [Highest-risk contradiction] -> [exact revision]
2. [Next issue] -> [exact revision]
3. [Next issue] -> [exact revision]

## Keep As-Is Signals
- [Aligned strength 1]
- [Aligned strength 2]

## Recommended Next
**Recommended next**: `[command]` - [why this command resolves highest-risk issues now]. **Alternatives**: `[command]`, `[command]`
```

## Guardrails

- Do not harmonize by weakening true evidence.
- Resolve contradictions toward the most verifiable source.
- If sources conflict and evidence is unclear, ask one question at a time instead of guessing.

## Examples

### Quick Scope Example

Candidate request:

"Check consistency between my resume and LinkedIn headline only."

Expected behavior:

- Run scoped audit (`resume` + `linkedin`).
- Return red/yellow flags with exact edit suggestions.
- Keep output concise for rapid correction.

### Standard Audit Example

Candidate request:

"Run `check-consistency` across resume, LinkedIn, and pitch before I start outreach next week."

Expected behavior:

- Compare all major surface pairs.
- Classify findings by Red/Yellow/Green.
- Produce prioritized fix queue and recommend next command.

### Deep Risk Example

Candidate request:

"I am in final rounds and want a full credibility check. Find contradictions across timeline, scope, and positioning."

Expected behavior:

- Build baseline from coaching state and active loops.
- Highlight highest-risk contradictions first.
- Provide smallest safe edits that preserve evidence integrity.
- Add loop-level risk note when contradiction affects active interviews.