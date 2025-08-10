-- Create schema if not exists
CREATE SCHEMA IF NOT EXISTS {schema};

-- Final table
CREATE TABLE IF NOT EXISTS {schema}.user_listens (
    user_name TEXT NOT NULL,
    recording_msid UUID NOT NULL,
    listened_at_ts TIMESTAMP NOT NULL,
    listened_date DATE NOT NULL,
    track_name TEXT,
    artist_name TEXT,
    release_name TEXT,
    PRIMARY KEY (user_name, recording_msid, listened_at_ts)
);

-- Staging table for ETL
CREATE TABLE IF NOT EXISTS {schema}.user_listens_staging (
    user_name TEXT NOT NULL,
    recording_msid TEXT NOT NULL,
    listened_at_ts TIMESTAMP NOT NULL,
    listened_date DATE NOT NULL,
    track_name TEXT,
    artist_name TEXT,
    release_name TEXT
);

-- index for queries by date
CREATE INDEX IF NOT EXISTS idx_on_user_listens
    ON {schema}.user_listens (listened_date);
