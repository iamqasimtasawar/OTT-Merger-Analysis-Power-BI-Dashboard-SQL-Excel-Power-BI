SELECT  
    'LioCinema' AS Platform,                                    -- Identifies the platform  
      
    COUNT(DISTINCT user_id) AS Total_Upgrade,                   -- Counts the total number of users who upgraded  
      
    new_subscription_plan AS Upgrade_To,                        -- Shows the plan users upgraded to  
      
    DATE_FORMAT(subscription_date, '%b') AS Month               -- Extracts and formats the month (e.g., Jan, Feb)  
      
FROM liocinema_db.subscribers  
WHERE  
    (CASE  
        WHEN subscription_plan = 'VIP' THEN 3  
        WHEN subscription_plan = 'Premium' THEN 2  
        WHEN subscription_plan = 'Free' THEN 1  
    END)  
    <                                                           -- Checks if the new plan has a higher rank (upgrade)  
    (CASE  
        WHEN new_subscription_plan = 'VIP' THEN 3  
        WHEN new_subscription_plan = 'Premium' THEN 2  
        WHEN new_subscription_plan = 'Free' THEN 1  
    END)  
GROUP BY Month, Upgrade_To  
      
UNION ALL  

SELECT  
    'Jotstar' AS Platform,                                      -- Identifies the platform  
      
    COUNT(DISTINCT user_id) AS Total_Upgrade,                   -- Counts the total number of users who upgraded  
      
    new_subscription_plan AS Upgrade_To,                        -- Shows the plan users upgraded to  
      
    DATE_FORMAT(subscription_date, '%b') AS Month               -- Extracts and formats the month (e.g., Jan, Feb)  
      
FROM jotstar_db.subscribers  
WHERE  
    (CASE  
        WHEN subscription_plan = 'VIP' THEN 3  
        WHEN subscription_plan = 'Premium' THEN 2  
        WHEN subscription_plan = 'Free' THEN 1  
    END)  
    <                                                           -- Checks if the new plan has a higher rank (upgrade)  
    (CASE  
        WHEN new_subscription_plan = 'VIP' THEN 3  
        WHEN new_subscription_plan = 'Premium' THEN 2  
        WHEN new_subscription_plan = 'Free' THEN 1  
    END)  
GROUP BY Month, Upgrade_To  
      
ORDER BY  
    Platform,                                                   -- Orders first by platform name  
      
    STR_TO_DATE(Month, '%b') ASC,                               -- Ensures correct month order (Jan → Dec)  
      
    Total_Upgrade DESC;                                         -- Orders by upgrade count in descending order  
