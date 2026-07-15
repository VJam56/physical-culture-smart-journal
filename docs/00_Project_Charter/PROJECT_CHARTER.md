# Physical Culture Smart Journal — Project Charter

**Baseline:** Engineering Baseline  
**Project Version:** 1.3.0  
**Status:** Approved  
**Last Updated:** 2026-07-15  
**Owner:** Product Owner

## 1. Purpose

Physical Culture Smart Journal exists to reduce the friction involved in preparing, executing, recording, and reviewing strength training.

The product should consolidate the athlete's training program, actual performance, immediate observations, recovery context, nutrition context, supplement context, and set-specific media into one coherent journal.

## 2. Product Identity

The application is:

- A personal research instrument
- A guided training journal
- An extension of the observer
- A tool for athletes and coaches
- A structured historical record

The application is not:

- A replacement for coaching
- A medical diagnostic system
- A surveillance platform
- A social network
- An automated authority over the user

## 3. Core Problem

The current training workflow is fragmented across:

- Excel
- Paper notes
- Voice observations
- Camera media
- Phone journal
- Manual historical review

This fragmentation increases preparation labor, interrupts training, and weakens the connection between a performance event and the observation made immediately afterward.

## 4. Core Product Promise

The user should be able to open the application, see the correct training session, perform the work, record observations with minimal effort, and later review an organized history with the mindset of a coach.

## 5. MVP Boundary

The MVP includes:

- User profile
- Excel training-program ingestion
- Training-session presentation
- Planned-versus-actual logging
- Set-specific written notes
- Set-specific microphone capture
- Set-specific camera capture
- Session-level reflection
- Recovery inputs
- Nutrition baseline and deviations
- Supplement baseline and deviations
- Body metrics
- Historical session review
- Cautious observation summaries

The MVP excludes:

- Genetics
- Bloodwork
- Medical diagnosis
- Automated training prescription
- Social features
- Public rankings
- Coaching marketplace
- Broad wearable integrations
- Population surveillance
- Epidemiological use

## 6. Design Principles

1. Reduce friction.
2. Prepare the workspace before training begins.
3. Preserve observations at the point of action.
4. Link every entry to the correct context.
5. Keep planned and actual data separate.
6. Preserve raw evidence.
7. Let AI organize information, not overrule the human.
8. State uncertainty.
9. Protect privacy by design.
10. Keep the MVP intentionally small.
11. Expand only after real-world use.
12. Prefer long-term historical coherence over isolated metrics.

## 7. Data Philosophy

Every stored input must have a clear purpose.

The project will distinguish:

- Raw user observations
- Imported source data
- Calculated values
- Statistical comparisons
- AI-generated inferences

Derived outputs must never erase or replace the source evidence from which they were produced.

## 8. Privacy Philosophy

The application should collect only the data required to improve the user's own training record.

Avoid unnecessary personal identifiers.

The user owns:

- Training records
- Journal entries
- Media
- Baselines
- Exported history

No user data should be repurposed for unrelated analysis without explicit consent.

## 9. Engineering Philosophy

The project follows this sequence:

Vision  
→ Requirements  
→ Architecture  
→ Blueprint  
→ Specification  
→ Implementation  
→ Testing  
→ Documentation update  
→ Release

Engineering priorities:

- Readability over cleverness
- Explicit relationships over hidden behavior
- Transactional integrity
- Traceable decisions
- Reproducible calculations
- Local-first reliability where practical
- Maintainability over premature optimization

## 10. Documentation Philosophy

The repository separates knowledge by purpose:

- `docs/` explains why the system exists and how it is designed.
- `specs/` defines what must be implemented and tested.
- Code directories contain the implementation.
- ADRs preserve why major decisions were made.
- Project-management documents preserve current state and next action.

The repository is the source of truth.

Chat conversations support the work but do not replace committed documentation.

## 11. Decision-Making

The Product Owner makes final product decisions.

The architecture process should:

1. Identify the user problem.
2. State assumptions.
3. Compare alternatives.
4. Record tradeoffs.
5. Preserve MVP boundaries.
6. Document accepted decisions in an ADR when material.

## 12. Collaboration Model

### Product Owner

Responsible for:

- Product direction
- Domain knowledge
- Real-world testing
- Final feature decisions
- Repository ownership

### ChatGPT

Responsible for:

- Systems architecture
- Product structure
- Specification development
- Documentation coherence
- Constructive technical review
- Scope control
- Reasoning support

### Codex / Implementation Agent

Responsible for:

- Writing code
- Creating migrations
- Implementing tests
- Refactoring
- Fixing defects
- Following accepted specifications

## 13. Versioning

The project uses semantic versioning:

- Major: fundamental product or architecture change
- Minor: meaningful feature or subsystem addition
- Patch: defect correction or clarification

Versions describe the repository as a whole.

## 14. Scope-Control Rule

New ideas are not automatically features.

They are recorded in the backlog until:

- Real usage demonstrates the need
- The feature improves the core workflow
- The tradeoff is documented
- An ADR approves the change

## 15. Current Engineering Objective

Map the user's actual Excel workbook into the import specification and relational schema.

Target output:

`specs/006_actual_workbook_mapping.md`

## 16. Definition of Success

The MVP succeeds when the user can rely on it during real training and it demonstrably reduces preparation and record-keeping friction while preserving a better historical record than the current manual workflow.
