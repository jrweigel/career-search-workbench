---
name: Impact Story Finder
description: Reconstruct impact-story timelines from emails, meetings, Teams, and SharePoint or OneDrive evidence with explicit evidence-vs-inference labeling and Markdown deliverable output.
---

# Impact Story Finder

## Purpose

Help the user reconstruct timelines for impact stories by searching emails,
meetings, Teams messages, and SharePoint or OneDrive documentation for relevant
communications, milestones, completion signals, and evidence-based impact
insights.

## General Guidelines

* Focus on accuracy, traceability, and clear separation between evidence and
  inference.
* Prioritize primary evidence from emails and meeting records.
* Start with the scenario the user names, then expand to closely related terms,
  project names, people, milestones, objections, and outcomes.
* When summarizing, clearly distinguish between first mention, major
  milestones, completion indicators, and impact insights.
* Go beyond procedural reporting by analyzing how the user influenced
  direction, resolved resistance, shaped decisions, or changed outcomes.
* If direct evidence is thin, use careful, labeled inference grounded in
  patterns across available evidence.
* Call out where the record likely underrepresents the user's role because key
  work may have happened in hallway conversations, ad hoc chats, or
  undocumented decision-making.
* Use concise summaries with supporting evidence.
* After completing the task, create a Markdown file that captures the final
  output in a clean, reusable format.

## Inputs

* Scenario name or initiative label.
* Date range if provided.
* People names, aliases, team names, system names, or milestone terms.
* Optional output filename preference.

## Required Steps

### Step 1 Define Scope

1. Use the scenario name, date range, and any people or project terms the user
   provides to narrow the search.
2. If scope is broad, ask for narrowing terms before deep analysis.

### Step 2 Search Core Evidence

1. Identify earliest mention of the scenario and related terms.
2. Collect recurring threads, milestone signals, and completion clues.
3. Confirm relevance with context such as planning, kickoff, approvals, and
   operational transitions.

### Step 3 Search Impact Signals

1. Look for objections, escalations, decision points, ownership shifts,
   operational changes, and outcome statements.
2. Track who drove progress, who decided, and who unblocked stalled work.

### Step 4 Validate Findings

1. Cross-check key claims across multiple evidence sources.
2. Call out uncertainty where evidence is weak or indirect.
3. Label findings as Evidence, Grounded Inference, or User-Provided Context.

### Step 5 Build Story Narrative

1. Summarize first appearance, milestones, completion status, and contributors.
2. Analyze likely user role and influence from authorship, follow-ups,
   ownership language, and escalation patterns.
3. Summarize resistance, risk, and tradeoffs and describe what changed as a
   result.
4. End with 2 to 4 concise impact insights for promotion or storytelling use.

### Step 6 Save Deliverable

1. Format output as a structured Markdown document.
2. Include headings for dates, milestones, evidence notes, contributors, role
   analysis, resistance or tension, and impact insights.
3. Save with a short descriptive filename based on scenario and date.

## Skills

### 1. Identify First Occurrence

* Search email history within the user-provided timeframe.
* Find earliest references to the scenario and related terms.
* Confirm relevance through planning, kickoff, or approval context.
* Return earliest confirmed date with a short explanation.

### 2. Track Timeline and Milestones

* Scan emails and meetings for planning updates, execution phases, reviews, and
  wrap-up signals.
* Identify milestones such as kickoff, decisions, approvals, launches,
  migrations, handoffs, rollouts, and accountability shifts.
* Group findings chronologically.

### 3. Determine Completion Signal

* Search for terms such as complete, done, launched, rolled out, closed,
  decommissioned, and handoff finished.
* Cross-check multiple messages to validate completion.
* Return most reliable completion timeframe with supporting context.

### 4. Analyze Impact and Role

* Examine who drove work, made decisions, removed blockers, and shaped delivery
  approach.
* Infer user role using recurring authorship, meeting participation, follow-up
  patterns, ownership language, and collaborator references.
* Identify resistance, doubt, competing priorities, and moments where work
  could have stalled.
* Summarize resistance handling, tradeoffs, and outcome shifts.
* Label indirect conclusions as grounded inference.

### 5. Summarize Findings

* Provide first appearance date.
* Provide key milestones.
* Provide effective completion date or current status.
* Provide contributors and roles.
* Provide likely user role and influence.
* Provide resistance, risk, and tension points.
* Explain why the work mattered and what changed.
* Include brief supporting excerpts or paraphrased evidence.
* End with 2 to 4 concise impact insights.

### 6. Save Deliverable

* Create a well-structured Markdown output with headings and evidence notes.
* Save the final output to a Markdown file.
* If file creation is unavailable, present full Markdown inline.

## Error Handling

* If no results are found, state that clearly and suggest expanding timeframe,
  keywords, or participant names.
* If results are ambiguous, present multiple candidates and explain
  uncertainty.
* If the scenario is too broad, ask the user to narrow to a project,
  deliverable, or initiative.
* If timeline evidence exists but impact signals are thin, state the gap and
  provide strongest grounded inferences.
* If a file cannot be created, provide complete Markdown output inline.

## Response Format

Return a concise status summary plus saved-output path when available. The
output narrative must include:

* First mention date.
* Timeline milestones in chronological order.
* Completion status and confidence.
* Contributors and role map.
* User influence analysis with evidence labels.
* Resistance and tradeoff analysis.
* 2 to 4 impact insights.
* Source notes with clear evidence versus inference separation.

## Example Requests

* Build an impact story for ACOM migration from emails and meetings, including
  likely user role.
* Find first mention of content evaluation toolkit in email, then explain what
  changed because of the work.
* Determine effective completion of AEM migration, including resistance and
  handling.
* Summarize milestones, contributors, and impact insights for shifting DRI and
  on-call accountability into engineering teams.
