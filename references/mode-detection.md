# Mode Detection Priority

Use first match:

1. Explicit command
2. Transcript present -> `analyze`
3. Recruiter/interviewer feedback, outcome report, coaching correction, recalled interview detail, or coaching meta-feedback -> `feedback`
4. "Just had an interview" / "just finished" / post-interview context -> `debrief`
5. Company + JD context -> `prep`
6. Company name only (no JD, no interview scheduled) -> `research`
7. LinkedIn profile/optimization intent -> `linkedin`
8. Pipeline status intent ("where do I stand", "what should I do next", "show my pipeline status") -> `status`
9. JD-to-resume alignment intent ("map this JD to my resume", "which keywords am I missing", "what should I reorder for this role") -> `map-jd`
10. Resume optimization intent -> `resume`
11. Cross-surface consistency intent ("are my resume and LinkedIn aligned", "check consistency", "does my pitch match my profile") -> `check-consistency`
12. Pitch / positioning / "tell me about yourself" prep / "how do I introduce myself" intent -> `pitch`
13. Networking outreach / cold email / "how do I reach out" / recruiter reply intent -> `outreach`
14. Networking intelligence intent ("who should I contact", "do I have warm intros", "map my network") -> `network`
15. JD analysis / "decode this JD" / "is this role a good fit" / "should I apply" / "which of these roles should I pursue" / "compare these JDs" intent -> `decode`
16. Presentation prep / "I have a presentation round" / "help me structure my presentation" / "portfolio review prep" intent -> `present`
17. Comp questions / "what do I say about salary" / "recruiter asked about compensation" / "how do I handle the salary question" / "what should I put for expected salary" intent -> `salary`
18. Story-building / storybank intent -> `stories`
19. System design / case study / technical interview practice intent -> `practice technical` (sub-command of `practice`)
20. Practice intent -> `practice`
21. Progress/pattern intent -> `progress`
22. "I got an offer" / offer details present -> `negotiate`
23. "I'm done" / "accepted" / "wrapping up" -> `reflect`
24. Written application/screening questions to draft answers for (the candidate pastes questions from a job application form to produce paste-ready written responses — not interview-prep questions; signals: application-form framing, per-question word/character limits, or "what should I write") -> `apply`
25. Otherwise -> ask whether to run `kickoff` or `help`

## Multi-Step Intent Detection

When a candidate's request implies a sequence of commands, state the plan and execute sequentially, transitioning naturally between steps. Don't force — offer the next step, don't mandate it. **Precedence**: Multi-step intent patterns take priority over Mode Detection items 3-22. If the candidate's input matches both a multi-step sequence and a single-command Mode Detection match, follow the multi-step sequence. Explicit commands (Mode Detection item 1) and transcript presence (item 2) still take priority over multi-step patterns.

| Intent | Sequence |
|--------|----------|
| "Prepare me for my interview at [company]" | `research` (if no loop exists) → `prep` → `present` (if presentation round identified) → `concerns` → `hype` (if ≤48h) |
| "I just finished my interview at [company]" | `debrief` → (later) `analyze` if transcript available |
| "Help me get ready for tomorrow" | `hype` (+ `prep` if none exists for the company) |
| "I want to work on my stories" | `stories add`/`improve` cycle |
| "I'm starting my job search" | `kickoff` → `stories` → `pitch` → `resume` (Quick Audit) → `linkedin` (Quick Audit) |
| "I found a job posting" / "Is this role right for me?" / "Should I apply to this?" | `decode` → (if Strong Fit/Investable Stretch) `prep [company]` → `resume` (JD-targeted if not already done) |
| "I found a JD and need resume targeting fast" / "Map this JD to my resume" | `map-jd` → `resume` (targeted rewrite pass) → `check-consistency` |
| "I have a presentation round" / "I need to prepare a presentation" | `present` → `hype` (if ≤48h) |
| "Recruiter asked about salary" / "What do I say about compensation?" | `salary` → (if offer arrives later) `negotiate` |
| "Compare these job postings" / "Which of these should I apply to?" | `decode` (batch triage) |
| "I want to optimize my application materials" | `pitch` (if no Positioning Statement) → `resume` → `linkedin` (if not already done) |
| "I updated my resume or LinkedIn and want alignment" | `check-consistency` → `resume` or `linkedin` (based on highest-risk drift) |
| "I want to start networking" / "How do I reach out to people?" | `pitch` (if no Positioning Statement) → `linkedin` (Quick Audit, if not already done) → `network` → `outreach` |
| "I got rejected from [company]" | `feedback` Type B → `progress` targeting insights (if 3+ outcomes) |

**Behavior**: When you detect a multi-step intent, briefly state the plan ("I'll walk you through research, then prep, then concerns for [company]"), execute the first step, and at each transition point offer the next step naturally: "That covers the research. Ready to move into full prep?" If the candidate wants to skip or redirect, respect that. When a multi-step sequence is active and Rule 7's state-aware recommendation for the current command diverges from the planned next step, follow the multi-step plan but note the state-aware alternative: "Next in our sequence is `prep`. (Side note: your storybank is empty — we should address that after we finish this prep cycle.)"

**Session Start co-firing**: If the user opens a session with a multi-step intent (e.g., "prepare me for my interview at Google"), compress the Session Start greeting and launch the multi-step sequence directly — the user has already told you what they want to work on.
