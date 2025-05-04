-- Query to get user distribution by age group, city tier, and subscription plan for each platform

SELECT 
    'LioCinema' AS Platform,              -- Label for LioCinema platform
    age_group,                            -- User age group
    city_tier,                            -- City tier classification
    subscription_plan,                    -- Subscription plan chosen by the user
    COUNT(user_id) AS user_count          -- Count of users in each category
FROM 
    liocinema_db.subscribers             -- Data source for LioCinema
GROUP BY 
    age_group, city_tier, subscription_plan

UNION ALL

SELECT 
    'Jotstar' AS Platform,                -- Label for Jotstar platform
    age_group,                            -- User age group
    city_tier,                            -- City tier classification
    subscription_plan,                    -- Subscription plan chosen by the user
    COUNT(user_id) AS user_count          -- Count of users in each category
FROM 
    jotstar_db.subscribers               -- Data source for Jotstar
GROUP BY 
    age_group, city_tier, subscription_plan;

-- Optional: ORDER BY Platform, age_group, city_tier, subscription_plan
