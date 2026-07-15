# ADR-006: Excel Is the Authoritative Program Source for the MVP

**Status:** Accepted  
**Date:** 2026-07-15  
**Decision Owner:** Product Owner  
**Project Version:** 1.3.1

## Context

The current training workflow already relies on a functioning Excel workbook that contains the user's live training program.

Requiring the user to rebuild the program manually inside the MVP would:

- Duplicate existing work
- Increase adoption friction
- Introduce transcription errors
- Delay validation of the core journal workflow
- Expand scope into a program-building interface before it is needed

## Decision

For the MVP, imported Excel workbooks are the authoritative source of planned training-program data.

The application will:

- Read the approved workbook structure
- Preserve the original source file and source references
- Normalize the workbook into relational records
- Display the imported plan inside the training interface
- Store actual performance separately from the imported prescription

The application will not initially provide a full manual program-authoring system.

## Alternatives Considered

### Manual Program Builder

Rejected for the MVP because it adds substantial interface and validation work before the core journal workflow has been tested.

### Cloud-Native Program Editor

Rejected for the MVP because it would replace an already functional planning tool without evidence that replacement is necessary.

### Unstructured Spreadsheet Attachment

Rejected because the application needs normalized program structure to display sessions, record sets, and attach journal entries correctly.

## Consequences

### Positive

- Lower setup friction
- Immediate compatibility with the user's real workflow
- Faster path to a functional training session
- Reduced duplicate data entry
- Clear provenance for every imported prescription

### Negative

- The initial importer will be workbook-specific
- Workbook changes may require parser-version updates
- Formula and formatting behavior must be handled carefully
- A future manual editor may require an additional ADR

## Implementation Requirements

- The workbook must never be modified by the importer.
- Imported program data must retain source references.
- Planned values must remain separate from actual performance.
- Failed imports must not activate partial programs.
- Duplicate imports must be detected.
- The real workbook mapping must be documented in `specs/006_actual_workbook_mapping.md`.

## Review Trigger

Revisit this decision only after the MVP has been used in practice and there is evidence that a native program editor would improve the core workflow.
