# ADR-007: Lock the Engineering Baseline

**Status:** Accepted  
**Date:** 2026-07-15  
**Decision Owner:** Product Owner  
**Project Version:** 1.3.1

## Context

The project now has a complete repository structure, project charter, architecture documents, data model, engineering blueprints, implementation specifications, decision records, project-management files, and starter implementation directories.

Repeated repository restructuring would create administrative work without advancing the product.

## Decision

The current Engineering Baseline is locked.

From this point forward:

- The top-level repository structure is stable.
- Existing folders are not renamed or reorganized without a material engineering reason.
- New documentation is created only when it supports implementation, testing, operation, or a recorded decision.
- The next project phase is implementation.
- Scope remains locked until real MVP usage produces evidence for change.

## Stable Top-Level Structure

- `.github/`
- `assets/`
- `backend/`
- `database/`
- `docs/`
- `frontend/`
- `prototypes/`
- `specs/`
- `tests/`

## Allowed Changes

- Add implementation files
- Add tests
- Add migrations
- Refine specifications required for active work
- Add ADRs for material decisions
- Update status, changelog, and roadmap
- Fix factual or structural defects

## Changes Requiring an ADR

- New top-level directory
- Major data-model redesign
- New product category
- Expansion beyond MVP boundaries
- Replacement of Excel as program authority
- Introduction of medical or prescriptive behavior
- Major technology-stack change after implementation begins

## Consequences

The project will stop optimizing its documentation structure and begin producing executable software.

Administrative changes are subordinate to working functionality.
