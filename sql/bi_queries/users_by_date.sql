-- ====================================
-- Q. How many users did listen to some song on specific date , e.g on the 1st of March 2019?
-- tod : date can be paramertized
-- ====================================

SELECT 
    COUNT(DISTINCT user_name) AS users_count
FROM {schema}.user_listens
WHERE listened_date = '2019-03-01';