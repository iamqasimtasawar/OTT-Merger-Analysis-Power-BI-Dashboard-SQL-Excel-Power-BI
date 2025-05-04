SELECT  
    'LioCinema' AS Platform,                                -- Identifies the platform  
    
    COUNT(user_id) AS Total_downgrade,                      -- Counts the total number of users who downgraded  
    
    DATE_FORMAT(subscription_date, '%b') AS Month          -- Extracts and formats the month from the subscription date  
FROM liocinema_db.subscribers  
WHERE  
    (CASE  
        WHEN subscription_plan = 'VIP' THEN 3  
        WHEN subscription_plan = 'Premium' THEN 2  
        WHEN subscription_plan = 'Free' THEN 1  
    END)  
    >  
    (CASE  
        WHEN new_subscription_plan = 'VIP' THEN 3  
        WHEN new_subscription_plan = 'Premium' THEN 2  
        WHEN new_subscription_plan = 'Free' THEN 1  
    END)  
GROUP BY Month  

UNION ALL  

SELECT  
    'Jotstar' AS Platform,                                 -- Identifies the platform  
    
    COUNT(user_id) AS Total_downgrade,                      -- Counts the total number of users who downgraded  
    
    DATE_FORMAT(subscription_date, '%b') AS Month          -- Extracts and formats the month from the subscription date  
FROM jotstar_db.subscribers  
WHERE  
    (CASE  
        WHEN subscription_plan = 'VIP' THEN 3  
        WHEN subscription_plan = 'Premium' THEN 2  
        WHEN subscription_plan = 'Free' THEN 1  
    END)  
    >  
    (CASE  
        WHEN new_subscription_plan = 'VIP' THEN 3  
        WHEN new_subscription_plan = 'Premium' THEN 2  
        WHEN new_subscription_plan = 'Free' THEN 1  
    END)  
GROUP BY Month  

ORDER BY  
    Platform,                                              -- Orders first by platform name ,                             
    Total_downgrade DESC;                                  -- Orders by downgrade count in descending order  
