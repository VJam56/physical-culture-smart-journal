# Database Blueprint

**Version:** 1.2.0  
**Status:** Draft  
**Owner:** Engineering

## Purpose

Provide a durable relational foundation for planned training, actual execution, contextual journal entries, and future observation logic.

## Design Principles

- Planned and actual data remain separate.
- Raw records are never overwritten by derived summaries.
- Context and sequence are first-class data.
- Imported source provenance is preserved.
- Historical records favor archival behavior over destructive deletion.
- The schema remains understandable without an ORM.

## Core Domains

### User and Profile

Stable internal user identity and voluntary profile fields.

### Program Definition

- Programs
- Imports
- Training days
- Exercise prescriptions
- Set prescriptions

### Session Execution

- Sessions
- Performed exercises
- Performed sets

### Guided Journal

- Journal entries
- Media assets

### Context

- Recovery
- Nutrition
- Supplements
- Body metrics

## Transaction Boundaries

Use transactions for:

- Program import
- Session completion
- Bulk journal reconstruction changes
- Schema migrations
- Baseline-plan replacement

## Identifier Strategy

Use globally unique string identifiers.

Implementation options:

- UUID
- ULID

ULID is preferable if sortable identifiers are useful, but the choice remains open until stack selection.

## Time Strategy

- Store timestamps in UTC.
- Store user timezone separately when required.
- Preserve entry order with explicit sequence numbers.
- Do not depend on timestamps alone for journal ordering.

## Units

Store measurement values and units separately.

Examples:

- `actual_load_value`
- `actual_load_unit`

Canonical conversion may occur in a service layer, but original entered units should remain recoverable.

## Constraints

The database should enforce:

- Positive sequence numbers
- Unique order within parent entities
- Valid percentage ranges
- Valid RPE range
- Referential integrity
- Nonnegative measurements where appropriate

## Migration Policy

- Every schema change requires a migration.
- Migrations are immutable after release.
- Data transformations must be reversible when practical.
- Schema version must be visible in project status.

## Backup and Export

The MVP should eventually support:

- Full user-data export
- Program export
- Session export
- Media manifest export

Physical media export may be separate from relational export.

## Testing

- Foreign-key behavior
- Transaction rollback
- Duplicate-order prevention
- Journal sequence preservation
- Import provenance
- Planned-versus-actual separation
- Archive behavior
- Unit-field consistency

## Acceptance Criteria

- The schema supports one complete imported program.
- A full session can be recorded without overwriting the plan.
- Every set-level note or media item can be traced to exact context.
- History can be reconstructed deterministically.
