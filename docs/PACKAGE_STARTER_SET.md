---
title: Package Starter Set
description: Public-safe starter file set for first-time installation and clean package distribution.
author: GitHub Copilot
ms.date: 2026-07-27
ms.topic: how-to
keywords:
  - package
  - starter-set
  - templates
estimated_reading_time: 5
---

## Purpose

This file defines the exact starter files that should be included in a shareable package.

## Include These Starter Files

* `templates/coaching_state-blank.md`
* `references/coaching-state-schema.md`
* `templates/application-tracker-template.md`
* `templates/interview-note-template.md`
* `templates/rejection-note-template.md`
* `templates/win-note-template.md`
* `templates/learnings-patterns-template.md`
* `templates/voice-brief-template.md`
* `templates/voice-business-writing-template.md`
* `templates/voice-blog-writing-template.md`
* `templates/linkedin-content-strategy-template.md`
* `templates/linkedin-content-integration-tracker-template.md`
* `templates/linkedin-post-drafts-template.md`
* `templates/linkedin-profile-rewrite-template.md`

## Do Not Include Populated Personal Artifacts

* `coaching_state.md`
* `applications/tracker.md`
* `applications/learnings/patterns.md`
* Date-stamped interview notes, rejection notes, and win notes
* Personal resumes and company-specific prep briefs

## First-Run Initialization

1. Run `kickoff` to initialize `coaching_state.md`.
2. Copy `templates/application-tracker-template.md` to `applications/tracker.md` if you want tracker-first operation.
3. Copy `templates/learnings-patterns-template.md` to `applications/learnings/patterns.md` when you start synthesis tracking.
4. Keep all personal working files local and excluded from public archives.
