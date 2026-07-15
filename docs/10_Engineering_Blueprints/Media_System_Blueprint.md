# Media System Blueprint

**Version:** 1.2.0  
**Status:** Draft / Deferred Implementation  
**Owner:** Engineering

## Purpose

Capture voice, photo, and video with automatic linkage to the active training context.

## Media Types

- Voice recording
- Photo
- Video

## Required Metadata

- Media asset ID
- User ID
- Session ID through journal entry
- Exercise ID when applicable
- Set ID when applicable
- Media type
- Storage reference
- MIME type
- Capture timestamp
- Duration when applicable
- Size
- Original filename when available

## Capture Flow

1. User taps microphone or camera beside a set
2. App locks current set context
3. Device capture interface opens
4. Capture completes or is canceled
5. Media saves to device storage as required
6. App creates media metadata
7. App creates journal entry linked to the captured context
8. Timeline updates
9. Background upload or sync occurs when implemented

## Context Locking

The set context must be captured before opening the device interface.

This prevents a later UI change from attaching media to the wrong set.

## Storage Strategy

MVP implementation should prefer:

- Local-first capture
- Stable local identifier
- Optional remote synchronization later

The final provider is intentionally undecided.

## Failure Handling

- Canceled capture creates no journal entry.
- Failed upload must not delete local media.
- Missing local file should show a recoverable error.
- Duplicate sync should not create duplicate journal entries.
- Permission denial should produce clear instructions.

## Privacy

- No automatic public sharing.
- Camera and microphone permissions are requested only when used.
- Media remains user-controlled.
- Metadata should not include unnecessary geolocation.
- Export and deletion behavior must be explicit.

## Tests

- Permission denied
- Capture canceled
- App backgrounded
- Interrupted recording
- Large video
- Offline capture
- Duplicate sync
- Wrong-set prevention
- Device-library save behavior

## Acceptance Criteria

- A capture initiated beside a set remains attached to that set.
- Local media survives network failure.
- The user can review media from the reconstructed session.
