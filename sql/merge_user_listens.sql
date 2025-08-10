---  Merge/upset to target tables
INSERT INTO {schema}.user_listens ( 
    user_name,
    recording_msid, 
    listened_at_ts, 
    listened_date,
    track_name, 
    artist_name, 
    release_name
)
SELECT 
    user_name,
    recording_msid::uuid,  
    listened_at_ts,
    listened_date,
    track_name,
    artist_name,
    release_name
FROM {schema}.user_listens_staging 
ON CONFLICT (user_name, recording_msid, listened_at_ts)
DO UPDATE SET
    track_name = EXCLUDED.track_name,
    artist_name = EXCLUDED.artist_name,
    release_name = EXCLUDED.release_name;