---
title: Story Library Contract
description: Invocation and storage contract for deep story artifacts in docs/story-library and coaching_state story index
author: Interview Coach
ms.date: 2026-07-13
ms.topic: reference
keywords:
  - stories
  - story library
  - mapping
  - artifacts
estimated_reading_time: 4
---

## Purpose

Define when commands should use the detailed story library and how it relates to story data in coaching state.

## Source Hierarchy

Use this hierarchy for story retrieval and updates.

1. coaching_state storybank table for fast indexing and scoring fields.
2. coaching_state Story Details for full STAR text when available.
3. docs/story-library story files for deeper canonical narrative artifacts.

When sources disagree, treat coaching_state as operational truth for current coaching decisions and update the story-library file at the next story maintenance action.

## Invocation Rules

Use docs/story-library in these situations.

1. prep and story-mapping when a question needs deeper context than index fields.
2. stories improve when refining narrative detail, stakes, and earned-secret quality.
3. progress when checking overuse, freshness, and coverage against target competencies.
4. resume/linkedin/pitch when mining differentiated narrative proof beyond short STAR summaries.

## File Pattern

Detailed story files should use this naming convention.

- S###-short-slug.md

Example:

- S026-learn-ai-investment-thesis.md

## Required Story File Fields

Each detailed story file should include:

1. Story ID and title.
2. Full STAR narrative.
3. Earned secret and deployment notes.
4. Evidence section with metrics, scope, and timeframe.
5. Version history notes.

Use docs/story-library/story-template.md as the authoring template.

## Storage Contract

- Keep quick operational fields in coaching_state.
- Keep deep narrative artifacts in docs/story-library.
- Keep command-generated prep briefs in applications/prep-briefs.

This separation keeps coaching fast while preserving reusable long-form narrative assets.
