# Database Schema

**Version:** 1.1.0  
**Status:** Draft for Validation  
**Implementation Reference:** `database/schema.sql`

## Design Goals

The relational model must preserve:

- Planned training structure
- Actual training execution
- Immediate set-level observations
- Chronological order
- Original imported values
- Personal baselines and contextual deviations
- Clear separation between raw data and derived analysis

## Core Entity Groups

### Identity and Profile

- `users`
- `user_profiles`

The MVP avoids unnecessary identifying data. The user record is primarily a stable internal owner for related records.

### Program Definition

- `programs`
- `program_imports`
- `training_days`
- `exercise_prescriptions`
- `set_prescriptions`

Programs are separated from sessions so planned training remains immutable and reviewable even after actual execution differs.

### Training Execution

- `sessions`
- `performed_exercises`
- `performed_sets`

Actual performance is stored separately from the planned prescription.

### Guided Journal

- `journal_entries`
- `media_assets`

A journal entry may be linked to:

- A session
- A performed exercise
- A performed set

This supports session-level reflection and exact set-level notes.

Entry types include:

- text
- voice
- photo
- video
- structured_observation
- system_event

### Contextual Inputs

- `recovery_entries`
- `meal_plans`
- `meal_plan_items`
- `nutrition_entries`
- `supplement_plans`
- `supplement_plan_items`
- `supplement_entries`
- `body_metrics`

The baseline plan and the actual deviation are stored separately.

## Ordering

The following fields preserve deterministic order:

- `training_days.day_order`
- `exercise_prescriptions.exercise_order`
- `set_prescriptions.set_number`
- `performed_exercises.exercise_order`
- `performed_sets.set_number`
- `journal_entries.sequence_number`

## Import Preservation

`program_imports` stores:

- Original filename
- File hash
- Import timestamp
- Import status
- Parser version
- Raw mapping metadata
- Validation report

This allows future parser improvements without losing the provenance of imported programs.

## Deletion Policy

The initial schema uses restrictive foreign keys for core historical records. Application-level archive behavior should be preferred over destructive deletion.

## Derived Analytics

Derived readiness scores, trend summaries, or AI observations are intentionally absent from this first schema. They should be added only after raw-data capture is validated.
