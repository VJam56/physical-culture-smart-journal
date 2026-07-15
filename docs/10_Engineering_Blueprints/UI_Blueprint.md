# User Interface Blueprint

**Version:** 1.2.0  
**Status:** Draft  
**Owner:** Product and Frontend

## Purpose

Provide a mobile-first training workspace that minimizes preparation and record-keeping effort.

## Primary MVP Screens

1. Today / Dashboard
2. Training Session
3. Session History
4. Session Detail
5. Program Import and Validation
6. Basic Profile and Baselines

## Dashboard

Must show:

- Today's scheduled session
- Start or resume action
- Current program and week
- Last completed session
- Minimal recovery prompt
- Day On/Off state

## Training Session

Must show:

- Ordered exercises
- Planned prescription
- Actual set fields
- Completion state
- Text note action
- Microphone action
- Camera action
- Session-level note
- Save/sync state

## Day On/Off Behavior

### Day On

Show the active training workflow.

### Day Off

Hide unnecessary set-entry controls and show:

- Recovery entry
- Optional body metrics
- Nutrition/supplement deviations
- General journal note
- Recent history

## Interaction Principles

- Large touch targets
- One-handed use where practical
- Minimal typing
- Autosave
- Clear active-set context
- No chart overload
- No modal chains for common actions
- Manual override always available

## Accessibility

- Sufficient contrast
- Dynamic text support
- Controls not dependent on color alone
- Clear labels for microphone and camera
- Screen-reader-friendly field names
- Error messages near relevant controls

## State Handling

The UI must represent:

- Loading
- Empty program
- Import validation required
- Planned session
- Active session
- Paused/interrupted session
- Completed session
- Offline
- Sync pending
- Error with recoverable action

## Tests

- One-handed set logging
- Large text size
- Interrupted session
- No program loaded
- Offline entry
- Permission denial
- Accidental navigation
- Resume after app restart
- Day On/Off transition

## Acceptance Criteria

- The user can begin the correct session quickly.
- A set can be recorded without leaving the session screen.
- Notes and media clearly belong to the intended set.
- The interface reduces rather than adds preparation labor.
