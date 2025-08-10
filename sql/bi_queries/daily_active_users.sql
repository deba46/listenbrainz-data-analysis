-- ====================================
-- Q. Daily active Users
-- 
-- ====================================

WITH
-- Get all distinct dates from the listens
all_dates AS (
    SELECT DISTINCT listened_date FROM {schema}.user_listens
),

-- Get distinct user listens per day
users_per_day AS (
    SELECT DISTINCT listened_date, user_name FROM {schema}.user_listens
),

-- Count distinct active users for each date over the previous 7 days window
active_users_window AS (
    SELECT
        d.listened_date,
        COUNT(DISTINCT u.user_name) AS number_active_users
    FROM all_dates d
    LEFT JOIN users_per_day u
        ON u.listened_date BETWEEN d.listened_date - INTERVAL '6 days' AND d.listened_date
    GROUP BY d.listened_date
),

-- Total unique users overall
total_users AS (
    SELECT COUNT(DISTINCT user_name) AS total_users FROM {schema}.user_listens
)

SELECT
    a.listened_date,
    a.number_active_users,
    ROUND((a.number_active_users::decimal / t.total_users) * 100, 2) AS percentage_active_users
FROM active_users_window a
CROSS JOIN total_users t
ORDER BY a.listened_date;