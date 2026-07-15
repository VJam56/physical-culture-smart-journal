# SPEC-001: Excel Program Import

**Project Version:** 1.3.0  
**Status:** Draft Pending Real Workbook Mapping  
**Priority:** Highest

## Purpose

Import the user's actual `.xlsx` training program into the application without requiring manual re-entry.

## In Scope

- Accept `.xlsx`
- Inspect workbook structure
- Identify mapped worksheets
- Read literal values and cached formula results
- Normalize program, day, exercise, and set structure
- Preserve source references
- Validate the import before activation
- Write the import atomically
- Report errors and warnings clearly

## Out of Scope

- `.xls`
- Macro execution
- Editing the original workbook
- Recalculating arbitrary Excel formulas
- Generic support for every possible training spreadsheet
- Automatic interpretation of unknown workbook structures without review

## Input Contract

Required:

- Workbook file
- Parser version
- User ID

Optional:

- Program display name
- Program start date
- Import notes

## Output Contract

On success:

- One `programs` record
- One `program_imports` record
- Ordered `training_days`
- Ordered `exercise_prescriptions`
- Ordered `set_prescriptions`
- Validation report
- Source mapping report
- Import status `completed`

On failure:

- One failed `program_imports` record when possible
- Validation report
- No active partial program

## Required Processing

1. Verify file extension.
2. Verify workbook can be opened.
3. Calculate source file hash.
4. Enumerate sheets.
5. Record hidden and visible sheets.
6. Apply the approved workbook mapping.
7. Read mapped values.
8. Preserve source references.
9. Normalize values.
10. Validate required fields.
11. Build an in-memory import model.
12. Generate warnings and errors.
13. Stop on fatal errors.
14. Require confirmation before activation.
15. Persist all program records in one transaction.
16. Mark import status.

## Source Reference Contract

Every imported exercise and set prescription must retain a source reference.

Format:

`<sheet_name>!<cell_or_range>`

Examples:

- `Week 1!B7`
- `Program!D12:F12`

## Normalized Field Rules

### Exercise Name

- Preserve original value.
- Trim surrounding whitespace.
- Do not silently rename.
- A separate comparison key may be generated later.

### Sets

- Must be positive integer when explicitly prescribed.
- If represented as repeated rows, preserve row order.
- If represented as one aggregate value, expand only under approved mapping rules.

### Repetitions

Support:

- Exact reps
- Minimum and maximum range
- Blank value with warning
- Text note preserved when not machine-readable

### Load

Support:

- Absolute load
- Percentage
- Blank
- Formula-derived cached result

Store value and unit separately.

### RPE/RIR

- RPE valid range: 0–10
- RIR nonnegative
- Preserve blank values
- Invalid numeric values produce validation errors

### Notes

- Preserve verbatim.
- Do not truncate silently.
- Unknown note columns must be reported rather than discarded.

## Formula Behavior

- Never execute macros.
- Never trust formula text as executable input.
- Read cached displayed results when available.
- Preserve formula text in raw mapping metadata.
- Warn when a required formula has no cached value.

## Duplicate Import Behavior

The system must compare:

- File hash
- Parser version
- User ID

A duplicate import must not create a second active program without explicit confirmation.

## Failure Behavior

Fatal failures include:

- Unsupported or corrupt workbook
- Missing approved worksheet
- Missing required program structure
- Unresolvable order
- Database transaction failure

No fatal failure may leave an active partial program.

## Security

- Enforce upload size limit.
- Reject unexpected file type.
- Do not execute workbook code.
- Do not expose workbook contents in general application logs.
- Store only necessary provenance.

## Acceptance Criteria

- The user's real workbook imports without manual transcription.
- Exercise and set order match the workbook.
- Notes remain intact.
- Imported values are traceable to source cells.
- Duplicate imports are controlled.
- Failed imports produce no active partial program.
- Validation messages are understandable to a non-engineer.

## Required Tests

- Valid approved workbook
- Duplicate workbook
- Corrupt workbook
- Missing sheet
- Hidden sheet
- Merged cells
- Blank decorative rows
- Formula with cached result
- Formula without cached result
- Unexpected column
- Invalid RPE
- Rep range
- Percentage load
- Database rollback

## Open Dependency

The actual training workbook must be inspected and mapped before this specification can move to `Approved`.
