# map-jd - JD-to-Resume Alignment

Use `map-jd` when the candidate wants a fast, evidence-safe bridge between a specific JD and their current resume.

## Purpose

Convert a raw JD into a focused resume action plan without fabricating claims.

## Inputs

Required:

- JD text (full paste preferred)
- Resume text (or explicit permission to use the latest resume from coaching state)

Optional:

- Company and role label
- Depth level: Quick Map / Standard / Deep Map (default: Standard)
- Target section preference (summary, skills, bullets, or full pass)

## Priority Check

Before running `map-jd`:

- If no kickoff has been run, offer: "I can still map this JD, but without your target context and storybank the guidance will be less precise. Continue or run `kickoff` first?"
- If interview is within 48 hours, prioritize `hype` or `prep` first.
- If no resume text is available, ask for paste or source location.

## Sequence

1. Parse JD into high-signal buckets:
   - top requirements (screening)
   - repeated themes (priority)
   - differentiators (nice-to-have)
2. Extract 8-12 priority signals from the JD and rank by likely recruiter weight.
3. Map each signal to resume evidence:
   - Strong match (direct evidence)
   - Partial match (adjacent evidence)
   - Gap (no support)
4. Build rewrite queue:
   - reorder top bullets in most recent roles
   - suggest summary language alignment
   - reorder skills by JD relevance
5. Apply evidence gate on every suggested change:
   - no unsupported claims
   - if evidence is weak, label it and ask a follow-up question before final wording
6. Produce a concise change set and recommended follow-up command.

## Depth Levels

| Level | When to Use | What It Covers |
|---|---|---|
| Quick Map | Fast triage before applying | 8 keyword/theme map + top 3 edits |
| Standard | Default role-target pass | 8-12 signals + bullet reorder plan + summary and skills recommendations |
| Deep Map | High-priority role, high stakes | Full Standard + section-level rewrite suggestions + concern-aware language constraints |

## Output Schema

```markdown
## JD-to-Resume Map: [Company] - [Role]

## JD Priority Signals
| # | Signal | Type | Priority | Confidence |
|---|---|---|---|---|
| 1 |  | Screening/Differentiating | High/Medium/Low | High/Medium/Low |

## Resume Coverage Map
| Signal | Match Level | Current Evidence | Risk | Action |
|---|---|---|---|---|
|  | Strong/Partial/Gap |  | Low/Medium/High | Keep/Rewrite/Add/Skip |

## Rewrite Queue (in order)
1. [Role/section] - [specific change]
2. [Role/section] - [specific change]
3. [Role/section] - [specific change]

## Safe Language Rewrites
- Before: "[existing text]"
  After: "[evidence-backed text]"

## Evidence Gaps to Resolve
- [Signal]: [what proof is missing] -> [exact question to answer]

## Recommended Next
**Recommended next**: `resume` - Apply these changes in a full resume optimization pass. **Alternatives**: `decode`, `check-consistency`
```

## Guardrails

- Never suggest adding skills or outcomes without evidence.
- Prefer reordering and reframing over inventing.
- If 3+ critical gaps exist, advise selective application strategy instead of forced matching.

## Examples

### Quick Map Example

Candidate request:

"Map this Senior TPM JD to my resume and tell me the top three changes before I apply tonight."

Expected behavior:

- Extract top signals (for example: cross-functional leadership, platform migration, KPI ownership).
- Produce a top-3 rewrite queue only.
- Flag unsupported claims instead of drafting speculative language.

### Standard Example

Candidate request:

"Run `map-jd` for this Principal TPM role at Microsoft and focus on summary, skills, and my two most recent roles."

Expected behavior:

- Extract 8-12 JD signals and rank by recruiter weight.
- Map each signal to Strong/Partial/Gap coverage.
- Suggest summary alignment language, bullet reordering, and skills reorder.
- End with next step recommendation: `resume` or `check-consistency`.

### Deep Map Example

Candidate request:

"This is a high-priority CAIO role. Do a Deep Map and show every high-risk evidence gap before I rewrite anything."

Expected behavior:

- Perform full Standard pass plus section-level rewrite guidance.
- Add concern-aware constraints for credibility risks.
- Separate safe rewrites from gaps requiring new evidence.
- If gaps are structural, recommend selective-apply strategy.