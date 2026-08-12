---
title: Career Search Workbench
description: Command-driven workspace for positioning, applications, networking, interview coaching, and job-search learning.
author: GitHub Copilot
ms.date: 2026-08-11
ms.topic: overview
keywords:
  - career-search
  - job-search
  - commands
  - setup
  - references
estimated_reading_time: 16
---

## Career Search Workbench

Career Search Workbench is a command-driven system for the full job-search lifecycle.

It helps you with:

* Role targeting and fit decisions
* Resume, LinkedIn, and positioning alignment
* Interview prep, drills, and full mock simulations
* Debrief, transcript analysis, and learning loops
* Networking, pipeline operations, and compensation strategy

## Relationship To Interview Coach

Career Search Workbench is an expanded distribution of
[Interview Coach](https://github.com/noamseg/interview-coach-skill), created by
[Noam Segal](https://github.com/noamseg) and used under the MIT License. The
original copyright notice is preserved in `LICENSE`.

Use the original Interview Coach if you want Noam's project and its upstream
release path. Use Career Search Workbench if you also want an opinionated,
file-based operating layer for managing the broader search. This extension adds:

* Application pipeline status and tracker-integrity checks through `status`
* Relationship prioritization and a persistent follow-up pipeline through `network`
* JD-to-evidence and resume-change mapping through `map-jd`
* Narrative consistency checks across resume, LinkedIn, pitch, and coaching state
  through `check-consistency`
* Blank starter assets for application tracking, learning capture, voice, and
  LinkedIn content planning
* Packaged routing for GitHub Copilot and other file-aware assistant environments

## What The Final Package Is

The final package is a reusable coaching framework plus templates and setup guides.

Included core:

* Command behavior and routing in `SKILL.md`
* Per-command specs in `references/commands/`
* Shared rubrics and frameworks in `references/`
* Worked calibration examples in `references/examples.md`
* Setup and usage guides in docs
* Public-safe starter templates in `templates/`

See:

* `docs/PUBLIC_DOCS.md`

## How The Main Folders Work

| Folder | Purpose |
|---|---|
| `references/commands/` | Workflow specifications for each user-facing command |
| `references/` | Shared engines, rubrics, schemas, and calibration examples used by commands |
| `templates/` | Blank distributable assets for initializing private working files |
| `applications/` | Private job-search data created as you use the coach; not included in the published package |

## Quick Start

1. Clone the repository:

  ```powershell
  git clone https://github.com/jrweigel/career-search-workbench.git
  cd career-search-workbench
  ```

2. Open the folder in your assistant environment.
3. Run `kickoff`.
4. Run `help`.

For full setup details, use `SETUP.md`.

## Setup Verification

Before first real use, confirm:

1. `SKILL.md` includes `map-jd` and `check-consistency`.
2. `references/commands/map-jd.md` and `references/commands/check-consistency.md` exist.
3. Running `help` exposes both commands.
4. `kickoff` can initialize or update `coaching_state.md`.
5. Templates exist in `templates/`.

## Full Command Catalog

### Phase 1: Role Direction and Targeting

| Command | Purpose |
|---|---|
| `decode` | JD analysis, fit scoring, and role triage |
| `research [company]` | Company research and fit assessment |

### Phase 2: Application Materials and Positioning

| Command | Purpose |
|---|---|
| `pitch` | Positioning statement and variants |
| `resume` | Resume optimization and rewrites |
| `linkedin` | LinkedIn profile optimization |
| `map-jd` | JD-to-resume alignment map with evidence-gated rewrite queue |
| `check-consistency` | Cross-surface alignment audit across resume, LinkedIn, pitch, and coaching state |
| `apply [company]` | Written screening-question responses |

### Phase 3: Interview Prep and Simulation

| Command | Purpose |
|---|---|
| `prep [company]` | Company + role prep brief |
| `concerns` | Likely concerns and counters |
| `questions` | Tailored interviewer questions |
| `stories` | Storybank creation and management |
| `practice` | Drill rounds and progression |
| `mock [format]` | Full simulated interview |
| `present` | Presentation-round coaching |
| `hype` | Pre-interview confidence and 3x3 plan |

### Phase 4: Analysis and Calibration

| Command | Purpose |
|---|---|
| `debrief` | Same-day interview capture |
| `analyze` | Transcript scoring and triage |
| `feedback` | Recruiter feedback and outcomes logging |
| `progress` | Trend review and self-calibration |

### Phase 5: Pipeline, Networking, and Compensation

| Command | Purpose |
|---|---|
| `status` | Pipeline snapshot and tracker integrity checks |
| `network` | Networking intelligence map and follow-up planning |
| `outreach` | Outreach coaching and message drafting |
| `salary` | Early/mid-process compensation coaching |
| `negotiate` | Post-offer negotiation coaching |
| `thankyou` | Thank-you and follow-up drafts |
| `reflect` | Post-search retrospective and archive |

### Meta

| Command | Purpose |
|---|---|
| `kickoff` | Initialize coaching profile |
| `help` | Show command guide |

## Practical Usage Paths

### 1) New Search Path

`kickoff` -> `decode` -> `research [company]` -> `prep [company]`

### 2) Targeted Application Path

`decode` -> `map-jd` -> `resume` -> `check-consistency` -> `apply [company]`

### 3) Fast Pre-Interview Path

`prep [company]` -> `concerns` -> `questions` -> `hype`

### 4) Practice Improvement Path

`stories` -> `practice` -> `mock [format]` -> `analyze`

### 5) Post-Interview Learning Loop

`debrief` -> `analyze` -> `feedback` -> `progress`

### 6) Networking Momentum Path

`status` -> `network` -> `outreach` -> `thankyou`

## Command Files Map

These are the command specification files under `references/commands/`:

1. `references/commands/analyze.md`: Scores transcript responses and chooses the next coaching move by bottleneck.
2. `references/commands/apply.md`: Drafts written screening-question responses using evidence-gated story selection.
3. `references/commands/check-consistency.md`: Audits alignment across resume, LinkedIn, pitch, and coaching-state narrative.
4. `references/commands/concerns.md`: Predicts interviewer concerns and builds counter-evidence strategies.
5. `references/commands/debrief.md`: Captures same-day interview notes before memory and signal quality decay.
6. `references/commands/decode.md`: Interprets JD signals, fit level, and role-prioritization implications.
7. `references/commands/feedback.md`: Logs recruiter feedback and outcomes to improve future recommendations.
8. `references/commands/help.md`: Produces a context-aware command guide and problem-to-command routing.
9. `references/commands/hype.md`: Runs pre-interview confidence and focus preparation.
10. `references/commands/kickoff.md`: Initializes profile, directness level, and foundational coaching state.
11. `references/commands/linkedin.md`: Optimizes profile content for relevance, credibility, and discoverability.
12. `references/commands/map-jd.md`: Maps JD requirements to resume evidence and prioritized rewrite actions.
13. `references/commands/mock.md`: Runs full mock interviews with format-specific evaluation.
14. `references/commands/negotiate.md`: Supports post-offer negotiation strategy and messaging.
15. `references/commands/network.md`: Builds contact-priority and follow-up pipelines.
16. `references/commands/outreach.md`: Drafts and improves networking and recruiter outreach messages.
17. `references/commands/pitch.md`: Creates positioning statements and context variants.
18. `references/commands/practice.md`: Runs staged drills for retrieval, structure, pressure handling, and adaptation.
19. `references/commands/prep.md`: Produces company and role prep briefs with predicted question focus.
20. `references/commands/present.md`: Coaches presentation-round structure, flow, and Q&A responses.
21. `references/commands/progress.md`: Reviews trends, calibration drift, and strategic coaching pivots.
22. `references/commands/questions.md`: Generates tailored questions to ask interviewers.
23. `references/commands/reflect.md`: Creates post-search retrospective and archive guidance.
24. `references/commands/research.md`: Builds structured company research and fit perspective.
25. `references/commands/resume.md`: Improves resume quality, ATS compatibility, and positioning clarity.
26. `references/commands/salary.md`: Pre-offer compensation planning and script preparation.
27. `references/commands/status.md`: Produces control-tower snapshots from tracker and learnings artifacts.
28. `references/commands/stories.md`: Builds, improves, drills, and curates a high-utility storybank.
29. `references/commands/thankyou.md`: Drafts thank-you and follow-up notes after interviews.

## Reference Architecture

### Core behavior and routing

* `SKILL.md`: Canonical command registry, operating rules, and file routing.
* `.github/copilot-instructions.md`: Environment bridge that routes assistant behavior to skill instructions.

### Command workflows

* `references/commands/`: One spec per command with sequence, output schema, and write behavior.

### Shared frameworks

* `references/cross-cutting.md`: Shared decision modules reused across commands.
* `references/interview-competencies.md`: Competency model for fit analysis and prep targeting.
* `references/rubrics-detailed.md`: Anchored scoring definitions for each quality dimension.
* `references/calibration-engine.md`: Calibration and drift logic for score-to-outcome alignment.
* `references/evidence-mine.md`: Protocol for extracting concrete evidence from stories and artifacts.
* `references/personal-brand-canon.md`: Cross-surface narrative contract for consistency.
* `references/storybank-guide.md`: Story quality, indexing, and retrieval standards.
* `references/transcript-processing.md`: Transcript parsing and analysis flow.
* `references/transcript-formats.md`: Supported transcript formats and normalization rules.

## Starter Files To Include In The Package

Include starter templates instead of personal state files:

* `templates/coaching_state-blank.md`: Public-safe starter for users who want a manual scaffold.
* `references/coaching-state-schema.md`: Full canonical schema used by kickoff and migration checks.
* `templates/application-tracker-template.md`: Starter tracker for pipeline operations.
* `templates/interview-note-template.md`: Starter template for debrief event notes.
* `templates/rejection-note-template.md`: Starter template for rejection analysis.
* `templates/win-note-template.md`: Starter template for advancement and win capture.
* `templates/learnings-patterns-template.md`: Starter template for recurring pattern synthesis.

Do not package a populated `coaching_state.md`. Let `kickoff` create state, or provide only the blank template.

## Package Guides

* `SETUP.md`
* `docs/CUSTOMIZE.md`
* `docs/COMMAND_CHEATSHEET.md`
* `docs/FAQ.md`
* `docs/PUBLIC_DOCS.md`
* `templates/`

## Repository Structure

```text
career-search-workbench/
├── SKILL.md
├── README.md
├── SETUP.md
├── CONTRIBUTING.md
├── LICENSE
├── VERSIONS.md
├── .github/
│   ├── copilot-instructions.md
│   ├── agents/
│   └── prompts/
├── references/
│   ├── commands/               # 29 command specs
│   └── *.md                    # shared frameworks and rubrics
├── docs/
│   ├── PUBLIC_DOCS.md
│   ├── CUSTOMIZE.md
│   ├── COMMAND_CHEATSHEET.md
│   └── FAQ.md
├── applications/               # private working data created during use
└── templates/                  # blank distributable starter assets
  └── *.md
```

## License

MIT. This distribution retains the original copyright and license notice from
[Interview Coach](https://github.com/noamseg/interview-coach-skill).
