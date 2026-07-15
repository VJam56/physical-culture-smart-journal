# Guided Journal Blueprint

**Version:** 1.2.0  
**Status:** Draft  
**Owner:** Product and Engineering

## Purpose

Create a journal from structured actions and immediate observations without forcing the athlete to maintain a separate narrative document.

## Journal Model

A journal entry is any meaningful, timestamped observation or action stored in context.

## Supported Entry Types

- Text
- Voice
- Photo
- Video
- Structured observation
- Recovery input
- Nutrition deviation
- Supplement deviation
- Session event
- System event

## Context Levels

### Session Level

Examples:

- Session started
- Session reflection
- General fatigue note

### Exercise Level

Examples:

- Setup change
- Equipment note
- Exercise-specific pain or cue

### Set Level

Examples:

- Immediate technical cue
- Voice observation
- Camera capture
- RPE explanation

## Entry Creation Sequence

1. User activates control
2. App resolves current session
3. App resolves exercise and set when applicable
4. App allocates next sequence number
5. Content or media metadata is stored
6. Entry appears immediately in session timeline
7. Autosave status is confirmed unobtrusively

## Ordering

Use explicit `sequence_number` within a session.

Timestamp remains important but does not replace sequence.

## Editing

- Text entries may be edited.
- Original creation timestamp remains.
- Updated timestamp should be added during implementation.
- Media replacement should create a new media asset reference.
- Deletion should default to soft deletion or archival if introduced.

## Offline Behavior

The eventual mobile implementation should permit local capture during poor connectivity.

Minimum requirement:

- Set logging should not fail because the network is unavailable.
- Journal entries should queue locally.
- Sync conflicts should preserve both records rather than silently discard one.

## UX Requirements

- Set-level actions remain beside the set.
- No unnecessary navigation.
- Capture should require minimal taps.
- The user should see that context was correctly assigned.
- Manual text remains available as a fallback.

## Tests

- Multiple entries on one set
- Session-level and set-level entries interleaved
- Rapid entry creation
- Interrupted recording
- Offline queue
- Sequence reconstruction
- Edited text
- Missing media file with retained metadata

## Acceptance Criteria

- The user can capture an observation immediately after a set.
- The entry is attached to the correct set.
- Timeline reconstruction remains deterministic.
- The process introduces less friction than the current manual workflow.
