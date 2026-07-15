# SPEC-002: Relational Database Schema

**Project Version:** 1.3.0  
**Status:** Draft  
**Priority:** Highest

## Purpose

Define the minimum relational data model required for imported programs, training execution, guided journal entries, contextual inputs, and future analysis.

## In Scope

- User ownership
- Anonymous profile
- Program import provenance
- Planned program structure
- Actual session execution
- Set-level journal linkage
- Media metadata
- Recovery
- Nutrition baseline and deviations
- Supplement baseline and deviations
- Body metrics
- Deterministic ordering

## Out of Scope

- Authentication implementation
- Billing
- Social features
- Population analytics
- Medical records
- Derived AI observations
- Remote media provider selection

## Authoritative Reference

Executable draft:

`database/schema.sql`

Design rationale:

`docs/03_Database/Database_Schema.md`

## Required Entities

- `users`
- `user_profiles`
- `programs`
- `program_imports`
- `training_days`
- `exercise_prescriptions`
- `set_prescriptions`
- `sessions`
- `performed_exercises`
- `performed_sets`
- `journal_entries`
- `media_assets`
- `recovery_entries`
- `meal_plans`
- `meal_plan_items`
- `nutrition_entries`
- `supplement_plans`
- `supplement_plan_items`
- `supplement_entries`
- `body_metrics`

## Required Data Separation

Planned data must not be overwritten by actual performance.

Examples:

- `set_prescriptions.target_load_value`
- `performed_sets.actual_load_value`

A change to an actual set must never mutate the original prescription.

## Identifier Contract

Every entity must have a stable unique string ID.

Approved implementation choices:

- UUID
- ULID

Final choice occurs during stack selection.

## Time Contract

- Persist timestamps in UTC.
- Preserve user-facing local date separately where required.
- Use explicit sequence numbers for journal order.
- Do not infer exact order from timestamps alone.

## Unit Contract

Measurements must store:

- Numeric value
- Unit

Examples:

- load
- body weight
- height

The service layer may calculate canonical units, but original units must remain recoverable.

## Referential Integrity

Required:

- Program belongs to user.
- Training day belongs to program.
- Exercise prescription belongs to training day.
- Set prescription belongs to exercise prescription.
- Session belongs to user.
- Performed exercise belongs to session.
- Performed set belongs to performed exercise.
- Journal entry belongs to session.
- Set-specific journal entry may reference performed set.
- Media metadata must remain linked through journal entry.

## Ordering Constraints

Unique ordering must be enforced within parent entities:

- Training days within a program
- Exercises within a training day
- Prescribed sets within an exercise
- Performed exercises within a session
- Performed sets within an exercise
- Journal entries within a session

## Transaction Requirements

Transactions are mandatory for:

- Program import
- Schema migrations
- Session finalization when multiple dependent writes occur
- Baseline plan replacement

## Deletion Behavior

- Prefer archival over destructive deletion.
- Core historical records should use restrictive foreign keys.
- Cascading deletion may be used only for subordinate configuration records where history is not lost.
- Application deletion behavior must be documented before implementation.

## Index Requirements

At minimum:

- Sessions by user and date
- Training days by program and order
- Exercises by training day and order
- Performed sets by performed exercise and order
- Journal entries by session and sequence
- Journal entries by set
- Body metrics by user and time

## Migration Requirements

- Every schema change requires a migration.
- Released migrations are immutable.
- Migration order must be deterministic.
- Destructive migrations require backup and explicit approval.
- Schema state must be testable from an empty database.

## Acceptance Criteria

- One complete program can be stored.
- One complete session can be recorded.
- Planned and actual values remain separate.
- Multiple notes or media entries can attach to one set.
- Journal history reconstructs deterministically.
- Import provenance remains available.
- Database constraints reject invalid ordering and invalid ranges.

## Required Tests

- Empty database migration
- Foreign-key enforcement
- Unique order conflicts
- Transaction rollback
- Planned/actual separation
- Multiple journal entries per set
- Session timeline ordering
- Import provenance
- Invalid RPE
- Invalid percentage
- Unit persistence
