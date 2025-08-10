-- ====================================
-- Q1: First song User listened
-- ====================================

SELECT user_name, track_name, listened_at_ts
FROM (
    SELECT 
        user_name,
        track_name,
        listened_at_ts,
        ROW_NUMBER() OVER (
            PARTITION BY user_name 
            ORDER BY listened_at_ts
        ) AS rn
    FROM {schema}.user_listens
) sub
WHERE rn = 1;