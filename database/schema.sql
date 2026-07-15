-- Physical Culture Smart Journal
-- Database Schema Draft v1.1.0
-- PostgreSQL-oriented SQL. Minor adaptation may be required for SQLite.

BEGIN;

CREATE TABLE users (
    user_id TEXT PRIMARY KEY,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_profiles (
    user_id TEXT PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE,
    age_years INTEGER,
    age_range TEXT,
    sex TEXT,
    height_value NUMERIC,
    height_unit TEXT,
    training_experience_years NUMERIC,
    work_type TEXT,
    default_stress_context TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (age_years IS NULL OR age_years >= 0),
    CHECK (training_experience_years IS NULL OR training_experience_years >= 0)
);

CREATE TABLE programs (
    program_id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
    program_name TEXT NOT NULL,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL DEFAULT 'draft',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE program_imports (
    program_import_id TEXT PRIMARY KEY,
    program_id TEXT NOT NULL REFERENCES programs(program_id) ON DELETE RESTRICT,
    source_filename TEXT NOT NULL,
    source_file_hash TEXT,
    parser_version TEXT,
    import_status TEXT NOT NULL,
    raw_mapping_json TEXT,
    validation_report_json TEXT,
    imported_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE training_days (
    training_day_id TEXT PRIMARY KEY,
    program_id TEXT NOT NULL REFERENCES programs(program_id) ON DELETE RESTRICT,
    day_order INTEGER NOT NULL,
    day_name TEXT,
    week_number INTEGER,
    scheduled_date DATE,
    notes TEXT,
    UNIQUE (program_id, day_order),
    CHECK (day_order > 0),
    CHECK (week_number IS NULL OR week_number > 0)
);

CREATE TABLE exercise_prescriptions (
    exercise_prescription_id TEXT PRIMARY KEY,
    training_day_id TEXT NOT NULL REFERENCES training_days(training_day_id) ON DELETE RESTRICT,
    exercise_order INTEGER NOT NULL,
    exercise_name TEXT NOT NULL,
    movement_category TEXT,
    prescription_notes TEXT,
    source_reference TEXT,
    UNIQUE (training_day_id, exercise_order),
    CHECK (exercise_order > 0)
);

CREATE TABLE set_prescriptions (
    set_prescription_id TEXT PRIMARY KEY,
    exercise_prescription_id TEXT NOT NULL REFERENCES exercise_prescriptions(exercise_prescription_id) ON DELETE RESTRICT,
    set_number INTEGER NOT NULL,
    target_reps_min INTEGER,
    target_reps_max INTEGER,
    target_load_value NUMERIC,
    target_load_unit TEXT,
    target_percentage NUMERIC,
    target_rpe NUMERIC,
    target_rir NUMERIC,
    set_notes TEXT,
    UNIQUE (exercise_prescription_id, set_number),
    CHECK (set_number > 0),
    CHECK (target_reps_min IS NULL OR target_reps_min >= 0),
    CHECK (target_reps_max IS NULL OR target_reps_max >= 0),
    CHECK (target_percentage IS NULL OR (target_percentage >= 0 AND target_percentage <= 100)),
    CHECK (target_rpe IS NULL OR (target_rpe >= 0 AND target_rpe <= 10)),
    CHECK (target_rir IS NULL OR target_rir >= 0)
);

CREATE TABLE sessions (
    session_id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
    training_day_id TEXT REFERENCES training_days(training_day_id) ON DELETE RESTRICT,
    session_date DATE NOT NULL,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    session_status TEXT NOT NULL DEFAULT 'planned',
    is_manual_override BOOLEAN NOT NULL DEFAULT FALSE,
    override_reason TEXT,
    session_summary TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE performed_exercises (
    performed_exercise_id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL REFERENCES sessions(session_id) ON DELETE RESTRICT,
    exercise_prescription_id TEXT REFERENCES exercise_prescriptions(exercise_prescription_id) ON DELETE RESTRICT,
    exercise_order INTEGER NOT NULL,
    exercise_name TEXT NOT NULL,
    is_unplanned BOOLEAN NOT NULL DEFAULT FALSE,
    exercise_notes TEXT,
    UNIQUE (session_id, exercise_order),
    CHECK (exercise_order > 0)
);

CREATE TABLE performed_sets (
    performed_set_id TEXT PRIMARY KEY,
    performed_exercise_id TEXT NOT NULL REFERENCES performed_exercises(performed_exercise_id) ON DELETE RESTRICT,
    set_prescription_id TEXT REFERENCES set_prescriptions(set_prescription_id) ON DELETE RESTRICT,
    set_number INTEGER NOT NULL,
    actual_reps INTEGER,
    actual_load_value NUMERIC,
    actual_load_unit TEXT,
    actual_rpe NUMERIC,
    actual_rir NUMERIC,
    completion_status TEXT NOT NULL DEFAULT 'pending',
    recorded_at TIMESTAMP,
    UNIQUE (performed_exercise_id, set_number),
    CHECK (set_number > 0),
    CHECK (actual_reps IS NULL OR actual_reps >= 0),
    CHECK (actual_rpe IS NULL OR (actual_rpe >= 0 AND actual_rpe <= 10)),
    CHECK (actual_rir IS NULL OR actual_rir >= 0)
);

CREATE TABLE media_assets (
    media_asset_id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
    media_type TEXT NOT NULL,
    storage_reference TEXT NOT NULL,
    original_filename TEXT,
    mime_type TEXT,
    duration_seconds NUMERIC,
    size_bytes INTEGER,
    captured_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (size_bytes IS NULL OR size_bytes >= 0),
    CHECK (duration_seconds IS NULL OR duration_seconds >= 0)
);

CREATE TABLE journal_entries (
    journal_entry_id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL REFERENCES sessions(session_id) ON DELETE RESTRICT,
    performed_exercise_id TEXT REFERENCES performed_exercises(performed_exercise_id) ON DELETE RESTRICT,
    performed_set_id TEXT REFERENCES performed_sets(performed_set_id) ON DELETE RESTRICT,
    media_asset_id TEXT REFERENCES media_assets(media_asset_id) ON DELETE RESTRICT,
    entry_type TEXT NOT NULL,
    text_content TEXT,
    structured_content_json TEXT,
    sequence_number INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (sequence_number > 0),
    UNIQUE (session_id, sequence_number)
);

CREATE TABLE recovery_entries (
    recovery_entry_id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL REFERENCES sessions(session_id) ON DELETE RESTRICT,
    sleep_duration_hours NUMERIC,
    sleep_quality_score NUMERIC,
    stress_score NUMERIC,
    energy_score NUMERIC,
    motivation_score NUMERIC,
    soreness_score NUMERIC,
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (sleep_duration_hours IS NULL OR sleep_duration_hours >= 0)
);

CREATE TABLE meal_plans (
    meal_plan_id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
    plan_name TEXT NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE meal_plan_items (
    meal_plan_item_id TEXT PRIMARY KEY,
    meal_plan_id TEXT NOT NULL REFERENCES meal_plans(meal_plan_id) ON DELETE CASCADE,
    item_order INTEGER NOT NULL,
    item_name TEXT NOT NULL,
    description TEXT,
    UNIQUE (meal_plan_id, item_order),
    CHECK (item_order > 0)
);

CREATE TABLE nutrition_entries (
    nutrition_entry_id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL REFERENCES sessions(session_id) ON DELETE RESTRICT,
    meal_plan_id TEXT REFERENCES meal_plans(meal_plan_id) ON DELETE RESTRICT,
    deviation_type TEXT,
    description TEXT,
    sequence_number INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE supplement_plans (
    supplement_plan_id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
    plan_name TEXT NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE supplement_plan_items (
    supplement_plan_item_id TEXT PRIMARY KEY,
    supplement_plan_id TEXT NOT NULL REFERENCES supplement_plans(supplement_plan_id) ON DELETE CASCADE,
    item_order INTEGER NOT NULL,
    supplement_name TEXT NOT NULL,
    dose_value NUMERIC,
    dose_unit TEXT,
    timing_description TEXT,
    UNIQUE (supplement_plan_id, item_order),
    CHECK (item_order > 0),
    CHECK (dose_value IS NULL OR dose_value >= 0)
);

CREATE TABLE supplement_entries (
    supplement_entry_id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL REFERENCES sessions(session_id) ON DELETE RESTRICT,
    supplement_plan_id TEXT REFERENCES supplement_plans(supplement_plan_id) ON DELETE RESTRICT,
    deviation_type TEXT,
    description TEXT,
    sequence_number INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE body_metrics (
    body_metric_id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
    measured_at TIMESTAMP NOT NULL,
    body_weight_value NUMERIC,
    body_weight_unit TEXT,
    body_fat_percentage NUMERIC,
    source TEXT,
    notes TEXT,
    CHECK (body_weight_value IS NULL OR body_weight_value >= 0),
    CHECK (body_fat_percentage IS NULL OR (body_fat_percentage >= 0 AND body_fat_percentage <= 100))
);

CREATE INDEX idx_training_days_program
    ON training_days(program_id, day_order);

CREATE INDEX idx_exercise_prescriptions_day
    ON exercise_prescriptions(training_day_id, exercise_order);

CREATE INDEX idx_sessions_user_date
    ON sessions(user_id, session_date);

CREATE INDEX idx_performed_exercises_session
    ON performed_exercises(session_id, exercise_order);

CREATE INDEX idx_performed_sets_exercise
    ON performed_sets(performed_exercise_id, set_number);

CREATE INDEX idx_journal_entries_session_sequence
    ON journal_entries(session_id, sequence_number);

CREATE INDEX idx_journal_entries_set
    ON journal_entries(performed_set_id);

CREATE INDEX idx_body_metrics_user_time
    ON body_metrics(user_id, measured_at);

COMMIT;
