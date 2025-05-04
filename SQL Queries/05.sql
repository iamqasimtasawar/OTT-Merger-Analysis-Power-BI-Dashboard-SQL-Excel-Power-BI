SELECT 
    'LioCinema' AS Platform,                           -- Identifies the platform
    ROUND(AVG(c.total_watch_time_mins), 0) AS AVG_WatchTime_Mins,  -- Rounds avg watch time
    s.city_tier,                                       -- City tier of the user
    c.device_type                                      -- Device type used
FROM liocinema_db.content_consumption c
JOIN liocinema_db.subscribers s 
    ON s.user_id = c.user_id                          -- Joining subscribers with consumption data
GROUP BY 
    s.city_tier, c.device_type, Platform                         -- Grouping by city tier and device type
    
UNION ALL 

SELECT 
    'Jotstar' AS Platform,                            -- Identifies the platform
    ROUND(AVG(c.total_watch_time_mins), 0) AS AVG_WatchTime_Mins,  -- Rounds avg watch time
    s.city_tier,                                      -- City tier of the user
    c.device_type                                    -- Device type used
FROM jotstar_db.content_consumption c
JOIN jotstar_db.subscribers s 
    ON s.user_id = c.user_id                          -- Joining subscribers with consumption data
GROUP BY 
    s.city_tier, c.device_type, Platform                       -- Grouping by city tier and device type
ORDER BY 
    Platform, AVG_WatchTime_Mins DESC;                          -- Sorting in descending order by watch time
