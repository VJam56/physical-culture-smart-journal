# Physical Culture Smart Journal

**Version:** 1.3.0  
**Status:** Foundation / Pre-implementation  
**Last Updated:** July 2026

## Overview

Physical Culture Smart Journal is a personal training intelligence system designed to reduce friction between planned training, actual execution, immediate observation, recovery context, and later review.

The application is not intended to replace coaching. It is a tool that strengthens the observer—the athlete, coach, or both—by preserving organized, indexed, longitudinal self-knowledge.

## Core Product Idea

The journal is not a blank page.

Every meaningful interaction is a journal entry:

- Completed set
- Load or repetition change
- RPE or RIR entry
- Written observation
- Voice note
- Photo or video attached to a set
- Sleep entry
- Stress score
- Meal selection
- Additional food or snack
- Supplement change
- Recovery observation

Each entry is stored in context and linked to the correct session, exercise, set, and time.

## MVP Goal

Prepare the training workspace, reduce record-keeping friction, and preserve high-quality observations without disrupting the training session.

## Current Status

The project vision, product philosophy, MVP boundaries, initial workflows, and early data model are defined. The implementation specification layer is established. The next formal engineering step is mapping the actual Excel workbook into SPEC-001 and the relational schema.

## Repository Map

- `docs/00_Project` — vision, principles, scope, glossary
- `docs/01_Product` — requirements, workflows, user stories
- `docs/02_Architecture` — system design and data flow
- `docs/03_Database` — schema and data dictionary
- `docs/04_UI_UX` — interaction and screen behavior
- `docs/05_AI` — observation and reasoning framework
- `docs/06_Development` — build plan, milestones, standards
- `docs/07_Research` — scientific and coaching references
- `docs/08_Decisions` — architecture decision records
- `docs/09_Project_Management` — project status, roadmap, backlog, and next task
- `docs/10_Engineering_Blueprints` — subsystem design blueprints
- `specs` — implementation contracts and acceptance criteria
- `backend`, `frontend`, `database`, `tests` — implementation areas

## Guiding Rule

Build the smallest useful system first. Test it in real training. Expand only after the workflow proves valuable.

## Engineering Baseline

See `ENGINEERING_BASELINE.md` and `docs/00_Project_Charter/PROJECT_CHARTER.md` for the complete project foundation.
