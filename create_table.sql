-- write your table creation sql here!
-- CREATE TABLE avg_sat(
--     dbn SERIAL PRIMARY KEY,
--     school_name text CONSTRAINT school_name_not_null NOT NULL,
--     number_of_sat_test_takers numeric CONSTRAINT num_test_takers_positive CHECK (number_of_sat_test_takers > 0),
--     sat_critical_reading_avg_score numeric,
--     sat_math_avg_score numeric,
--     sat_writing_avg_score numeric
-- );
CREATE TABLE avg_sat(
    dbn text PRIMARY KEY,
    school_name text CONSTRAINT school_name_not_null NOT NULL,
    number_of_sat_test_takers text,
    sat_critical_reading_avg_score text,
    sat_math_avg_score text,
    sat_writing_avg_score text
);