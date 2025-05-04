SELECT  
    'LioCinema' AS Platform,                                                              -- Identifies the platform  
    
    city_tier,                                                                           -- City category (Tier 1, 2, 3)  
    
    COUNT(user_id) AS total_user,                                                        -- Total number of users in the city tier  
    
    SUM( CASE WHEN subscription_plan IN ('Basic', 'Premium') THEN 1 ELSE 0 END ) AS paid_user,  -- Counts only paid users  
    
    ROUND(   
        SUM( CASE WHEN subscription_plan IN ('Basic', 'Premium') THEN 1 ELSE 0 END )  
        / COUNT(user_id) * 100, 2  
    ) AS Percentage_Paid_user                                                            -- Calculates the percentage of paid users  
    
FROM liocinema_db.subscribers  
GROUP BY city_tier  

UNION ALL  

SELECT  
    'JotStar' AS Platform,                                                               -- Identifies the platform  
    
    city_tier,                                                                           -- City category (Tier 1, 2, 3)  
    
    COUNT(user_id) AS total_user,                                                        -- Total number of users in the city tier  
    
    SUM( CASE WHEN subscription_plan IN ('Premium', 'VIP') THEN 1 ELSE 0 END ) AS paid_user,  -- Counts only paid users  
    
    ROUND(   
        SUM( CASE WHEN subscription_plan IN ('Premium', 'VIP') THEN 1 ELSE 0 END )  
        / COUNT(user_id) * 100, 2  
    ) AS Percentage_Paid_user                                                            -- Calculates the percentage of paid users  
    
FROM jotstar_db.subscribers  
GROUP BY city_tier  

ORDER BY  
    Platform,                                                                            -- Orders first by platform name  
    city_tier;                                                                           -- Orders next by city tier  
