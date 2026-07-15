# ADR-008: Protect the Athlete's Concentration

**Status:** Accepted  
**Date:** 2026-07-15  
**Project Version:** 1.3.2

## Context

High-effort strength training is a concentration and psychological task. During a demanding set, the athlete's attention is appropriately directed toward execution: bracing, timing, technique, confidence, effort, and commitment.

The athlete should not be required to interrupt this state to manage records, navigate applications, reconstruct program details, or organize media.

Immediate observations are also perishable. The next set can overwrite technical sensations, perceived difficulty, setup quality, confidence, pain, instability, and comparisons with prior sessions.

## Decision

The application will protect the athlete's concentration.

The primary training experience should feel like walking onto a well-organized platform at a meet:

- The objective is clear.
- Required information is already prepared.
- Necessary capture tools are already in place.
- Administrative decisions are minimized.
- The athlete's responsibility is execution.

The application should never require the athlete to stop being an athlete in order to become a record keeper.

## Governing Product Test

Every MVP interaction should satisfy at least one condition:

1. It reduces cognitive or administrative burden.
2. It preserves coaching-quality evidence that would otherwise be lost.

If it does neither, it should normally be deferred.

## Supporting Principles

- Capture first; organize later.
- Mind on the objective, not the process.
- Defaults over repeated entry.
- Record deviations rather than rebuilding baselines.
- Progressive disclosure.
- Analysis remains outside the critical lifting rhythm.

## Implementation Requirements

- Today's session is prepared when the app opens.
- The active exercise and set are visually obvious.
- Set completion requires minimal interaction.
- Microphone and camera controls remain beside the exact set.
- Autosave removes routine save decisions.
- Repeatable information is preloaded.
- Session analysis never blocks the next set.
- Secondary analytics do not compete with the current objective.

## Consequences

This decision may cause some detailed organization to occur after the immediate set or after the session. That is acceptable. Immediate evidence capture and preservation of concentration take priority over perfect in-session documentation.
