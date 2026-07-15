# SPEC-005: AI Observation Output

**Project Version:** 1.3.0  
**Status:** Deferred Until Reliable Historical Data Exists  
**Priority:** Later

## Purpose

Generate cautious, source-linked observations from the user's longitudinal training record.

## In Scope

- Data completeness review
- Personal baseline comparison
- Planned-versus-actual comparison
- Repeated association detection
- Contradiction detection
- Confidence statement
- Supporting record links
- Missing-data warning
- Fact/comparison/inference labeling

## Out of Scope

- Medical diagnosis
- Treatment advice
- Injury prediction as fact
- Automatic program rewriting
- Population epidemiology
- Genetic interpretation
- Hidden prescriptive scoring

## Required Output Structure

Each observation must contain:

- `observation_id`
- `observation_type`
- `statement`
- `time_window`
- `comparison_baseline`
- `supporting_record_ids`
- `contradicting_record_ids`
- `confidence_level`
- `missing_data`
- `inference_disclosure`
- `created_at`
- `model_or_rule_version`

## Observation Types

- `fact`
- `comparison`
- `association`
- `anomaly`
- `insufficient_evidence`

## Language Contract

Allowed:

"Reported RPE was higher than your recent comparable sessions."

"Lower sleep occurred alongside higher perceived difficulty in three recent sessions."

"The record is too sparse to determine whether this pattern is stable."

Not allowed:

"You are overtrained."

"Poor sleep caused this performance."

"You should reduce training volume."

## Confidence Contract

Confidence must consider:

- Comparable sample count
- Data completeness
- Measurement consistency
- Effect magnitude
- Contradictory examples
- Time stability
- Possible confounders

## Traceability

Every nontrivial statement must link back to the records used.

The interface must allow the user to inspect supporting sessions.

## No-Result Behavior

The system must be able to return:

`insufficient_evidence`

This is a valid outcome and preferable to invented coherence.

## Versioning

Every observation must identify the model or ruleset version used.

Recomputed observations must not erase the original source records.

## Acceptance Criteria

- Facts and inferences are visibly distinct.
- Weak evidence produces cautious language.
- Contradictions are not hidden.
- Supporting records are inspectable.
- The system can decline to infer.
- No medical or causal certainty appears without valid evidence.

## Required Tests

- Sparse history
- Complete history
- Contradictory examples
- Missing recovery data
- One extreme outlier
- Repeated association
- No association
- Unsafe diagnostic wording
- Unsupported causal wording
- Model version change
