# Product Requirements Document

**Version:** 1.0.0  
**Status:** Foundation

## Problem

The current workflow requires the athlete to move between an Excel program, handwritten notes, camera photos, and a separate journal archive. This creates friction before, during, and after training.

The workflow is useful but labor-intensive:

1. Open the Excel program
2. Identify the current session
3. Rewrite or reference the workout
4. Perform the lift
5. Record observations separately
6. Photograph written notes
7. Store the record elsewhere
8. Reconstruct the context later

## Product Objective

Place the complete training workspace in one interface so the athlete can focus on lifting while preserving structured observations.

## Core User Outcome

The user opens the application and immediately sees the correct session, records performance with minimal effort, attaches observations to the exact set, and later reviews an organized history.

## Functional Requirements

- Program import
- Session scheduling
- Session override
- Exercise and set display
- Planned-versus-actual logging
- Set-specific text note
- Set-specific microphone action
- Set-specific camera action
- Recovery capture
- Nutrition baseline and deviation capture
- Supplement baseline and deviation capture
- Historical session review
- Cautious AI-generated summaries

## Non-Functional Requirements

- Mobile-first
- Fast interaction during training
- Reliable local persistence
- Clear data ownership
- Minimal interface clutter
- Traceable data relationships
- Extensible architecture
- Privacy-first defaults

## Product Boundary

The application supports observation and decision-making. It does not diagnose, prescribe medical treatment, or claim causal certainty.
