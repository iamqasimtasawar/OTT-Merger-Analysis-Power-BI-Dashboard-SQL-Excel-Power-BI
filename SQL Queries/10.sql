SELECT  
    'LioCinema' AS Platform,                                                                 -- Identifies the platform  
    subscription_plan,
    SUM(
        CASE  
            WHEN subscription_plan = 'Basic' THEN 69 * TIMESTAMPDIFF(MONTH, subscription_date, 
                LEAST(COALESCE(plan_change_date, '2024-11-30'), '2024-11-30'))  
                
            WHEN subscription_plan = 'Premium' THEN 129 * TIMESTAMPDIFF(MONTH, subscription_date, 
                LEAST(COALESCE(plan_change_date, '2024-11-30'), '2024-11-30'))  
        END  
    ) AS Total_Revenue                                                                       -- Calculates total revenue for LioCinema  

FROM liocinema_db.subscribers  

WHERE subscription_date BETWEEN '2024-01-01' AND '2024-11-30'                              -- Filters data within the analysis period  
AND subscription_plan IN ('Basic', 'Premium')                                             -- Considers only paid subscriptions  
GROUP BY subscription_plan

UNION ALL  

SELECT  
    'JotStar' AS Platform,                                                                 -- Identifies the platform  
    subscription_plan,
    SUM(
        CASE  
            WHEN subscription_plan = 'VIP' THEN 159 * TIMESTAMPDIFF(MONTH, subscription_date, 
                LEAST(COALESCE(plan_change_date, '2024-11-30'), '2024-11-30'))  
                
            WHEN subscription_plan = 'Premium' THEN 359 * TIMESTAMPDIFF(MONTH, subscription_date, 
                LEAST(COALESCE(plan_change_date, '2024-11-30'), '2024-11-30'))  
        END  
    ) AS Total_Revenue                                                                     -- Calculates total revenue for Jotstar  

FROM jotstar_db.subscribers  

WHERE subscription_date BETWEEN '2024-01-01' AND '2024-11-30'                              -- Filters data within the analysis period  
AND subscription_plan IN ('VIP', 'Premium')                                               -- Considers only paid subscriptions  
GROUP BY subscription_plan
ORDER BY Platform;  
