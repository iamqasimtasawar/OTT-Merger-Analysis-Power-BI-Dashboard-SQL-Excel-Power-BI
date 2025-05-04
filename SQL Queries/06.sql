SELECT 
    'Liocinema' AS Platform,                              -- Identifies the platform
    CASE 
        WHEN s.last_active_date IS NULL THEN 'Inactive'   -- Inactive if no last active date
        ELSE 'Active'                                     -- Active if there's a last active date
    END AS user_status, 
    ROUND(AVG(c.total_watch_time_mins), 0) AS AVG_WatchTimeMins,  -- Average watch time rounded to 0 decimal places
    COUNT(DISTINCT s.user_id) AS user_count               -- Count of distinct users
FROM liocinema_db.content_consumption c
JOIN 
    liocinema_db.subscribers s 
    ON s.user_id = c.user_id                              -- Join subscribers to consumption data
GROUP BY user_status                                      -- Group by user status (Active/Inactive)

UNION ALL

SELECT 
    'Jotstar' AS Platform,                                 -- Identifies the platform
    CASE 
        WHEN s.last_active_date IS NULL THEN 'Inactive'    -- Inactive if no last active date
        ELSE 'Active'                                      -- Active if there's a last active date
    END AS user_status, 
    ROUND(AVG(c.total_watch_time_mins), 0) AS AVG_WatchTimeMins,  -- Average watch time rounded to 0 decimal places
    COUNT(DISTINCT s.user_id) AS user_count               -- Count of distinct users
FROM jotstar_db.content_consumption c
JOIN 
    jotstar_db.subscribers s 
    ON s.user_id = c.user_id                              -- Join subscribers to consumption data
GROUP BY user_status                                      -- Group by user status (Active/Inactive)

ORDER BY AVG_WatchTimeMins;                               -- Order by average watch time (ascending or descending)
