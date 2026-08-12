---
title: Customization Guide
description: How to tailor the interview coach package to your target roles, voice, and workflow.
author: GitHub Copilot
ms.date: 2026-07-27
ms.topic: how-to
keywords:
  - customization
  - resume
  - linkedin
  - interview-prep
estimated_reading_time: 8
---

## What To Customize First

1. Target role and seniority in `kickoff`
2. Positioning backbone using `pitch`
3. Resume and LinkedIn alignment using `resume`, `linkedin`, and `check-consistency`
4. JD targeting sequence using `decode` and `map-jd`

## Voice Customization

Use templates in `templates/` if you do not want to start from existing docs.

Priority order:

1. `templates/voice-brief-template.md`
2. `templates/voice-business-writing-template.md`
3. `templates/voice-blog-writing-template.md`

Then copy into `docs/` as your working voice files.

## Competency and Role Calibration

Use these references:

* `references/interview-competencies.md`
* `references/calibration-engine.md`
* `references/rubrics-detailed.md`

If you add company overlays, keep the general model as fallback.

## Job Targeting Workflow

Recommended sequence:

1. `decode` for role-fit read
2. `map-jd` for targeted rewrite queue
3. `resume` to apply updates
4. `check-consistency` to remove contradictions
5. `prep [company]` for interview strategy

## Networking and Branding

Use:

* `outreach` for messaging quality
* `network` for contact priority
* `linkedin` for profile optimization
* `templates/linkedin-content-strategy-template.md` as the content-system baseline

For public-safe starter assets, use these templates:

* `templates/linkedin-content-strategy-template.md`
* `templates/linkedin-content-integration-tracker-template.md`
* `templates/linkedin-post-drafts-template.md`
* `templates/linkedin-profile-rewrite-template.md`
