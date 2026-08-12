---
title: Interview Coach Setup Guide
description: Step-by-step setup and verification for the public interview coach package.
author: GitHub Copilot
ms.date: 2026-07-27
ms.topic: how-to
keywords:
  - setup
  - interview-coach
  - onboarding
estimated_reading_time: 6
---

## Goal

Set up the package in a new workspace and verify that command routing works before you start real coaching sessions.

## Prerequisites

* Access to VS Code with GitHub Copilot Chat, Claude Code, or another compatible assistant environment
* Local Git installed if cloning from GitHub

## Setup Steps

1. Clone or download the repository.
2. Open the repository folder in your assistant environment.
3. Keep `SKILL.md` as the system skill file unless your environment requires renaming.
4. Confirm that `references/commands/` contains all command specs.
5. Run `help` to ensure commands render correctly.

## Private Working Data

The published package does not contain an `applications/` workspace. Commands create
private application, interview, and learning files there as you use the coach. Blank
starter assets remain under `templates/` so personal data is never part of the
distributed package.

## First-Run Verification

Use this checklist after setup:

* `kickoff` runs and creates or updates `coaching_state.md`
* `map-jd` is available in `help`
* `check-consistency` is available in `help`
* `resume` and `linkedin` commands route correctly
* `status` runs even if tracker files are not yet populated

## Recommended First Session

1. Run `kickoff`
2. Run `decode` on one JD
3. Run `map-jd`
4. Run `resume`
5. Run `check-consistency`

## Troubleshooting

If a command is not recognized:

* Open `SKILL.md` and verify the command exists in the Command Registry
* Open `references/mode-detection.md` for intent routing rules
* Open `references/commands/help.md` to validate command exposure rules

If voice files are missing:

* Use templates under `templates/`
* Or continue with plain, direct style and command-specific constraints
