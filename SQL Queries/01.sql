SELECT 
    'LioCinema' AS Platform,                          -- Labeling platform as 'Lio'
    COUNT(user_id) AS Total_User,               -- Counting total users per month
    DATE_FORMAT(subscription_date, '%b') AS Month,  -- Formatting month as 'Jan', 'Feb', etc.
    MONTH(subscription_date) AS Month_Num       -- Extracting numerical month for proper sorting
FROM 
    liocinema_db.subscribers
GROUP BY 
    Month, Month_Num  -- Grouping by both month name and month number to maintain order

UNION ALL

SELECT 
    'Jotstar' AS Platform,                      -- Labeling platform as 'Jotstar'
    COUNT(user_id) AS Total_User,               -- Counting total users per month
    DATE_FORMAT(subscription_date, '%b') AS Month,  -- Formatting month as 'Jan', 'Feb', etc.
    MONTH(subscription_date) AS Month_Num       -- Extracting numerical month for proper sorting
FROM 
    jotstar_db.subscribers
GROUP BY 
    Month, Month_Num  -- Grouping by both month name and month number to maintain order

ORDER BY 
    Month_Num;  -- Sorting by numerical month to get correct order (Jan → Dec)
