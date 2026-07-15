# MVP Data Dictionary

**Version:** 1.0.0  
**Status:** Draft

## User Profile

- user_id
- age_or_age_range
- sex
- height
- current_weight
- body_fat_percentage
- training_experience_years
- work_type
- default_stress_context
- created_at
- updated_at

## Program

- program_id
- user_id
- program_name
- source_filename
- import_version
- start_date
- status
- created_at

## Training Day

- training_day_id
- program_id
- day_order
- day_name
- scheduled_date
- completion_status

## Exercise Prescription

- prescription_id
- training_day_id
- exercise_name
- movement_category
- exercise_order
- planned_sets
- planned_reps
- planned_load
- planned_rpe
- planned_rir
- notes

## Session

- session_id
- user_id
- training_day_id
- session_date
- started_at
- completed_at
- session_status
- override_reason
- session_summary

## Performed Set

- performed_set_id
- session_id
- prescription_id
- set_number
- actual_reps
- actual_load
- actual_rpe
- actual_rir
- completion_status
- recorded_at

## Journal Entry

- journal_entry_id
- session_id
- performed_set_id
- entry_type
- text_content
- media_reference
- sequence_number
- created_at

## Recovery Entry

- recovery_entry_id
- session_id
- sleep_duration
- sleep_quality
- stress_score
- energy_score
- motivation_score
- soreness_score
- notes

## Nutrition Entry

- nutrition_entry_id
- session_id
- meal_plan_id
- deviation_type
- description
- sequence_number
- created_at

## Supplement Entry

- supplement_entry_id
- session_id
- supplement_plan_id
- deviation_type
- description
- sequence_number
- created_at

## Body Metric

- body_metric_id
- user_id
- measured_at
- body_weight
- body_fat_percentage
- source
