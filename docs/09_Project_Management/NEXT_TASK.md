# Next Engineering Task

**Task ID:** XLS-001  
**Title:** Map the Real Training Workbook  
**Status:** Ready When Workbook Is Available  
**Priority:** Highest

## Objective

Inspect the user's actual training workbook and convert the generic import contract into an exact workbook mapping.

## Authoritative Specifications

- `specs/001_excel_import.md`
- `specs/002_database_schema.md`
- `docs/10_Engineering_Blueprints/Excel_Import_Blueprint.md`
- `database/schema.sql`

## Required Work

- Identify authoritative worksheets.
- Identify week and day structure.
- Identify exercise rows.
- Identify set, repetition, load, RPE, RIR, rest, and note fields.
- Record formulas, merged cells, hidden rows, and hidden sheets.
- Define exact source-cell mapping.
- Define normalization rules for this workbook.
- Define validation warnings.
- Produce example normalized records.

## Acceptance Criteria

- Every required program value has a defined source.
- Decorative cells are distinguished from data.
- Exercise and set order are deterministic.
- Notes are preserved.
- Ambiguities are documented rather than guessed.
- The result is implementable without reopening product-design discussions.

## Output

`specs/006_actual_workbook_mapping.md`

## Blocker

The workbook must be available in the active working session.
