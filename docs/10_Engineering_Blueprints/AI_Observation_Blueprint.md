# AI Observation Blueprint

**Version:** 1.2.0  
**Status:** Deferred Implementation / Active Design  
**Owner:** AI Systems

## Purpose

Transform organized historical records into cautious, inspectable observations that support athlete and coach judgment.

## MVP Boundary

The AI layer is not part of the first end-to-end program-import milestone.

It should be implemented only after reliable data capture and historical review exist.

## Inputs

- Planned training
- Actual training
- Recovery entries
- Nutrition and supplement deviations
- Body metrics
- Journal text
- Historical baselines
- Data completeness indicators

## Outputs

Each observation should contain:

- Observation statement
- Supporting records
- Time window
- Comparison baseline
- Confidence or evidence strength
- Alternative explanations
- Missing-data warning
- Clear inference label

## Processing Layers

1. Data quality check
2. Baseline calculation
3. Current-versus-baseline comparison
4. Repeated association search
5. Contradiction search
6. Observation drafting
7. Safety and boundary review
8. User-facing presentation

## Statement Types

### Fact

Directly stored or calculated.

Example:
"Three working sets were completed."

### Comparison

Derived from stored records.

Example:
"Reported RPE was higher than the median of the previous four comparable sessions."

### Inference

A cautious interpretation.

Example:
"Lower sleep may have contributed, but the available record does not establish causation."

## Prohibited Behavior

- Medical diagnosis
- Injury prediction stated as fact
- Causal certainty from observational data
- Automated program changes without user action
- Hidden scoring logic presented as objective truth
- Invented literature citations

## Explainability

Every observation must be traceable to source records.

The user should be able to open the records supporting a statement.

## Confidence

Confidence should depend on:

- Number of comparable observations
- Data completeness
- Measurement consistency
- Magnitude of deviation
- Presence of contradictory examples
- Stability across time

## Tests

- Sparse data
- Missing recovery data
- Contradictory sessions
- Outlier performance
- Repeated association
- No meaningful pattern
- Incorrect causal phrasing
- Unsupported medical interpretation

## Acceptance Criteria

- Facts, calculations, and inferences are distinguishable.
- Weak evidence produces cautious language.
- Supporting records are visible.
- The system can choose to report that no reliable pattern exists.
