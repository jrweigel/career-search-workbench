---
title: Interview Coach Copilot Instructions
description: Repository-specific Copilot instructions for the interview coach skill and communication drafting behavior
author: GitHub Copilot
ms.date: 2026-07-27
ms.topic: reference
keywords:
	- copilot
	- instructions
	- voice
	- communication
estimated_reading_time: 2
---

## Core Routing

Use `SKILL.md` as the primary behavior specification for this repository.

## Operational Rules

* At session start, read `SKILL.md` first.
* Keep `coaching_state.md` as persistent state across sessions.
* Detect and execute the command the user typed (`kickoff`, `prep`, `analyze`, `practice`, etc.).
* Before executing a command, read `references/commands/[command].md`.
* Also read additional files required by the command as defined in `SKILL.md` File Routing.
* For `prep` and `decode`, load competency references via `SKILL.md` routing (company-specific overlay first, then general fallback).
* For positioning and messaging outputs, load `references/personal-brand-canon.md`; for proof extraction, load `references/evidence-mine.md`.
* Enforce one-question-at-a-time sequencing and strengths-first coaching delivery.
* End workflows with clear next command suggestions.

## Communication Drafting Rule

For any request to draft, rewrite, polish, or critique written communication in the user's voice, always load voice guidance in this order before producing the draft:

1. Universal voice foundation using the first available file in this list:
   * `docs/voice-brief.md`
   * `templates/voice-brief-template.md`
2. Content-type overlay:
	* Business writing: first available from `docs/voice-business-writing.md` or `templates/voice-business-writing-template.md`
	* Personal blog or article writing: first available from `docs/voice-blog-writing.md` or `templates/voice-blog-writing-template.md`
	* LinkedIn profile or About writing: hybrid mode using business first, then selected blog authenticity cues

If no voice files are available, continue with command-specific constraints and plain, direct language instead of blocking execution.

This applies to direct drafting requests and to commands where the output is communication-heavy, including `outreach`, `thankyou`, `apply`, `linkedin`, `pitch`, and similar writing tasks.

When using layered voice guidance:

* Preserve the user's facts, intent, and actual constraints first.
* Apply guidance at the level of tone, framing, structure, and phrasing, not mimicry.
* Keep command-specific requirements intact if they are more specific than the voice guidance.
* For LinkedIn profile and About outputs, keep language plain and direct, readable by a broad audience, while using only selective SEO or ATS keywords where they fit naturally.
* If the user explicitly asks for a different tone, follow the user's request over the default voice guidance.

## Session Continuity

If `coaching_state.md` is missing and no command is provided, suggest `kickoff`.

If `coaching_state.md` exists, continue from saved state instead of re-running kickoff.
