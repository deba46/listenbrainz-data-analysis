-- Query: Top 10 Users by Songs Listened
SELECT 
    user_name,
    COUNT(*) AS songs_listened
FROM {schema}.user_listens
GROUP BY user_name
ORDER BY songs_listened DESC
LIMIT 10;