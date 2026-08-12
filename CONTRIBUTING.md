---
title: Contributing Guide
description: Contribution process and quality expectations for the interview coach package.
author: GitHub Copilot
ms.date: 2026-07-27
ms.topic: how-to
keywords:
  - contributing
  - pull-requests
  - quality
estimated_reading_time: 5
---

## Scope

Contributions should improve coaching quality, command reliability, documentation clarity, or packaging safety.

## Contribution Flow

1. Open an issue describing the change.
2. Propose the affected files and expected behavior.
3. Submit a pull request with focused changes.
4. Include before and after examples for command behavior changes.

## Quality Requirements

* Keep command specs deterministic and schema-driven
* Preserve evidence and anti-fabrication guardrails
* Avoid introducing dependencies on personal files
* Keep markdown files with frontmatter and clear purpose

## Change Types

Accepted:

* New command capabilities with routing updates
* Improvements to existing command schemas
* Documentation and setup hardening
* Packaging and privacy safety improvements

Needs explicit review:

* Behavioral changes to scoring or calibration logic
* Changes that impact multiple command workflows
* New persistent-state fields in `coaching_state.md`

## Pull Request Checklist

* Updated command docs in `references/commands/` when behavior changed
* Updated routing in `SKILL.md` and `references/mode-detection.md` when needed
* Updated `references/commands/help.md` for command discoverability
* Added or updated tests or simulation notes where relevant
* Confirmed no personal artifacts are introduced
