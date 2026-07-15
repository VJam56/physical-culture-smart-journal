# Known Issues

## KI-001 — Excel Structure Not Yet Formalized

The current workbook has not yet been mapped sheet-by-sheet and column-by-column.

Impact:
The program import service cannot be specified completely.

## KI-002 — Technology Stack Pending

The repository intentionally avoids premature commitment to a frontend, backend, and database framework.

Impact:
Executable migrations may require adaptation after stack selection.

## KI-003 — Media Storage Pending

The schema stores media metadata, but the physical storage provider and upload pipeline are not yet selected.

Impact:
Voice, photo, and video implementation remains a later milestone.

## KI-004 — Unit Normalization

Load, body weight, height, duration, and other measurements require an explicit unit strategy.

Impact:
The schema currently stores unit fields but the conversion policy must be finalized.
