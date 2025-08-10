-- ====================================
--  Q. the top 3 days on which User had the most listens
-- ======================================================

WITH listens_per_day AS (
    SELECT
        user_name,
        listened_date,
        COUNT(*) AS number_of_listens
    FROM {schema}.user_listens
    GROUP BY user_name, listened_date
),
ranked_listens AS (
    SELECT
        user_name,
        listened_date,
        number_of_listens,
        ROW_NUMBER() OVER (PARTITION BY user_name ORDER BY number_of_listens DESC) AS rn
    FROM listens_per_day
)
SELECT
    user_name,
    number_of_listens,
    listened_date
FROM ranked_listens
WHERE rn <= 3
ORDER BY user_name, number_of_listens DESC;