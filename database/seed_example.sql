-- Example seed data for schema validation only.
-- Identifiers are illustrative and contain no personal information.

BEGIN;

INSERT INTO users (user_id)
VALUES ('user_demo');

INSERT INTO user_profiles (
    user_id,
    age_range,
    height_value,
    height_unit,
    training_experience_years,
    work_type
)
VALUES (
    'user_demo',
    'adult',
    0,
    'unspecified',
    0,
    'unspecified'
);

INSERT INTO programs (
    program_id,
    user_id,
    program_name,
    status
)
VALUES (
    'program_demo',
    'user_demo',
    'Imported Training Program',
    'active'
);

INSERT INTO training_days (
    training_day_id,
    program_id,
    day_order,
    day_name,
    week_number
)
VALUES (
    'day_demo_1',
    'program_demo',
    1,
    'Training Day 1',
    1
);

INSERT INTO exercise_prescriptions (
    exercise_prescription_id,
    training_day_id,
    exercise_order,
    exercise_name
)
VALUES (
    'exercise_demo_1',
    'day_demo_1',
    1,
    'Example Exercise'
);

INSERT INTO set_prescriptions (
    set_prescription_id,
    exercise_prescription_id,
    set_number,
    target_reps_min,
    target_reps_max
)
VALUES (
    'set_demo_1',
    'exercise_demo_1',
    1,
    5,
    5
);

COMMIT;
