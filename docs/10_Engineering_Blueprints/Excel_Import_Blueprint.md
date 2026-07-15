# Excel Import Blueprint

**Version:** 1.2.0  
**Status:** Draft Pending Workbook Inspection  
**Owner:** Engineering

## Purpose

Convert the user's training workbook into normalized program, training-day, exercise-prescription, and set-prescription records while preserving source provenance.

## Scope

The MVP importer must:

- Accept `.xlsx`
- Inspect workbook sheets
- Identify the authoritative training-program structure
- Preserve raw source references
- Normalize planned training into database entities
- Produce a validation report
- Require confirmation before activating an imported program

## Inputs

- Original workbook
- Import request
- Parser version
- Optional user-supplied program start date

## Outputs

- Program record
- Program import record
- Ordered training days
- Ordered exercise prescriptions
- Ordered set prescriptions
- Validation report
- Import warnings and errors

## Processing Sequence

1. Receive file
2. Calculate file hash
3. Open workbook in read-only mode
4. Enumerate sheets
5. Record sheet dimensions and visible/hidden state
6. Inspect formulas and displayed values
7. Apply workbook-specific mapping rules
8. Normalize rows and cells
9. Validate required fields
10. Build an in-memory import model
11. Generate validation report
12. Require user confirmation
13. Write records inside one database transaction
14. Mark import complete or failed

## Source Preservation

For every imported field, preserve enough provenance to reconstruct where it came from.

Recommended source reference format:

`sheet_name!cell_or_range`

Examples:

- `Week 1!B7`
- `Program!D12:F12`

## Formula Handling

- Preserve the original formula when present.
- Read the cached displayed value when available.
- Do not recalculate complex workbook formulas in the MVP.
- Warn when a required value depends on an unavailable cached result.
- Record whether the normalized value came from a literal, formula, or inferred mapping.

## Normalization Rules

- Trim leading and trailing whitespace.
- Preserve original exercise text.
- Create normalized comparison text separately.
- Store load value and load unit separately.
- Store percentages numerically.
- Preserve notes verbatim.
- Preserve exercise and set order.
- Do not silently discard unknown columns.

## Validation Categories

### Fatal Errors

- Workbook cannot be opened
- No recognizable program structure
- Required training days missing
- Exercise ordering cannot be determined
- Transaction fails

### Warnings

- Missing load
- Missing RPE/RIR
- Ambiguous repetition range
- Formula without cached value
- Unknown note field
- Duplicate apparent training day

### Informational Messages

- Empty decorative rows skipped
- Formatting-only cells ignored
- Hidden sheet detected
- Optional field absent

## Import Idempotency

The importer should use the file hash and parser version to detect duplicate imports.

A repeated import must not create duplicate active records without explicit user confirmation.

## Error Recovery

- No partial program should remain active after a failed import.
- Failed imports should retain a validation report.
- The original file should remain untouched.
- The user should be able to retry with a newer parser version.

## Security and Privacy

- Validate file type and size.
- Never execute macros.
- Do not trust workbook formulas.
- Avoid logging personal workbook contents unnecessarily.
- Store only required source metadata.

## Tests

- Valid workbook
- Workbook with multiple sheets
- Hidden sheets
- Formulas with cached values
- Formulas without cached values
- Blank rows
- Merged cells
- Duplicate import
- Corrupt workbook
- Unexpected columns
- Repetition ranges
- Percentage-based loads

## Acceptance Criteria

- The user's current workbook can be imported without manual re-entry.
- Imported order matches the workbook.
- Notes are preserved.
- Planned values are traceable to source cells.
- Errors are understandable.
- No partial active program remains after failure.

## Pending Input

The user's actual workbook must be inspected before final mapping rules are approved.
