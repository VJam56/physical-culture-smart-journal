# SPEC-003: Training Session Workflow

**Project Version:** 1.3.0  
**Status:** Draft  
**Priority:** High

## Purpose

Allow the athlete to open the correct workout, execute it, record actual performance, and preserve progress with minimal interruption.

## In Scope

- Show scheduled session
- Start session
- Resume session
- Override scheduled session
- Record actual sets
- Add unplanned exercise
- Record session-level notes
- Autosave
- Complete session
- Reopen history in read-only mode initially

## Out of Scope

- Automated program modification
- Coach live collaboration
- Social sharing
- Advanced analytics
- Video technique analysis
- Automatic load recommendation

## Session States

- `planned`
- `active`
- `paused`
- `completed`
- `abandoned`

## Start Behavior

When the user starts a planned session:

1. Create `sessions` record.
2. Copy the exercise display order into `performed_exercises`.
3. Do not copy actual set values.
4. Preserve links to prescriptions.
5. Mark session `active`.
6. Record session-start system journal event.

## Resume Behavior

- The application must restore the active session after navigation or restart.
- Existing performed sets must remain.
- Pending sets must remain editable.
- Sequence numbering must continue correctly.

## Set Recording Contract

For each performed set, support:

- Set number
- Actual repetitions
- Actual load value
- Actual load unit
- RPE
- RIR
- Completion status
- Recorded time

At minimum, the user must be able to mark a set complete even when optional fields are blank.

## Unplanned Exercise Behavior

The user may add an exercise not present in the prescription.

Required:

- `is_unplanned = true`
- User-entered exercise name
- Explicit order within session
- No prescription ID required

## Override Behavior

The user may select a different planned training day.

Store:

- `is_manual_override = true`
- Override reason when provided
- Original scheduled context when available

## Autosave

- Save after meaningful field changes.
- Display unobtrusive status.
- Never require the user to manually save each set.
- Local persistence should be preferred before remote synchronization.

## Completion Behavior

Before completion:

- Warn about pending sets, but allow completion.
- Preserve incomplete work.
- Record completion timestamp.
- Add session-completed system journal event.
- Do not calculate AI conclusions synchronously in the critical completion path.

## Failure Behavior

- A network failure must not erase recorded sets.
- Duplicate submission must not create duplicate performed sets.
- Navigation away must not silently abandon the session.
- Invalid optional fields should be highlighted without blocking unrelated entries.

## Acceptance Criteria

- The correct planned session opens.
- A full workout can be recorded.
- The session survives reload or restart.
- Planned values remain unchanged.
- Unplanned work can be captured.
- Completion preserves incomplete sets.
- The workflow is faster than the existing Excel-plus-paper process.

## Required Tests

- Start planned session
- Resume after restart
- Duplicate save
- Add unplanned exercise
- Override training day
- Complete with pending sets
- Offline set recording
- Invalid RPE
- Rapid consecutive set entries
- Session abandonment
