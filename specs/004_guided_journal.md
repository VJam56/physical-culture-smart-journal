# SPEC-004: Guided Journal

**Project Version:** 1.3.0  
**Status:** Draft  
**Priority:** High

## Purpose

Capture immediate observations as structured, contextual journal entries during and around a training session.

## In Scope

- Session-level text
- Exercise-level text
- Set-level text
- Voice metadata linkage
- Photo metadata linkage
- Video metadata linkage
- Structured observation entry
- Chronological timeline
- Autosave
- Context confirmation

## Out of Scope

- Public sharing
- Automatic transcription accuracy guarantees
- Automatic video analysis
- Long-form rich-text editor
- Collaborative commenting

## Entry Types

- `text`
- `voice`
- `photo`
- `video`
- `structured_observation`
- `system_event`

## Context Contract

Every entry must contain:

- Session ID
- Entry type
- Sequence number
- Created timestamp

Optional context:

- Performed exercise ID
- Performed set ID
- Media asset ID
- Text content
- Structured JSON content

## Context Resolution

When initiated beside a set:

1. Capture session ID.
2. Capture performed exercise ID.
3. Capture performed set ID.
4. Allocate next sequence number.
5. Open capture interface.
6. Save result under the locked context.

The UI must not resolve set context only after capture completes.

## Timeline Contract

Timeline sorting uses:

1. Session ID
2. Sequence number

Timestamp is displayed but is not the sole ordering source.

## Text Entry Behavior

- User can create and edit text.
- Original creation time remains.
- Implementation should add `updated_at`.
- Empty text should not create an entry unless explicitly saved as a structured event.

## Media Entry Behavior

- Media asset is created first or atomically with journal entry.
- Canceled capture creates no journal entry.
- Failed remote upload must preserve local metadata and local file.
- Missing media should not remove the journal record.

## Structured Observation Behavior

May store fields such as:

- Technique cue
- Pain flag
- Effort description
- Equipment change
- Environment note

Structured fields must remain optional and extensible.

## Failure Behavior

- Wrong-set attachment is a critical defect.
- Duplicate media sync must not duplicate journal entries.
- Sequence conflicts must resolve without data loss.
- Offline entries must queue locally.
- Conflicting edits should preserve the most recent explicit user action and retain recoverable history when practical.

## Acceptance Criteria

- Text, voice, photo, and video can attach to the exact set.
- Timeline order is deterministic.
- Multiple entries can attach to one set.
- Session-level notes coexist with set-level notes.
- Capture adds less friction than the manual process.
- Network failure does not destroy local entries.

## Required Tests

- Multiple entries on one set
- Session and set entries interleaved
- Context lock during camera capture
- Context lock during voice capture
- Capture canceled
- Offline entry
- Duplicate sync
- Sequence conflict
- Edit text
- Missing media file
