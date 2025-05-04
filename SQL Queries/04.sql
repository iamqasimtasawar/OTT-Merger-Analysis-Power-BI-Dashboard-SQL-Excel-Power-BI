SELECT 
    'LioCinema' AS Platform,                               -- Platform label
    s.age_group,                                           -- Age group of the users
    s.subscription_plan,                                   -- Subscription plan of the users
    s.user_status,                                         -- Status: Active or Inactive
    s.status_count AS user_count,                          -- Count of users for the status
    ROUND(s.status_count / t.total_count * 100, 2) AS percentage  -- Percentage calculation
FROM 
    (
        SELECT 
            age_group,
            subscription_plan,
            CASE 
                WHEN last_active_date IS NULL THEN 'Active'
                ELSE 'Inactive'
            END AS user_status,                           -- Determine user status
            COUNT(user_id) AS status_count                -- Count users per status
        FROM liocinema_db.subscribers                    -- Data from LioCinema database
        GROUP BY age_group, subscription_plan, user_status
    ) s
    INNER JOIN 
    (
        SELECT 
            age_group,
            subscription_plan,
            COUNT(user_id) AS total_count               -- Total count of users per group
        FROM liocinema_db.subscribers                    -- Data from LioCinema database
        GROUP BY age_group, subscription_plan
    ) t 
    ON s.age_group = t.age_group 
    AND s.subscription_plan = t.subscription_plan

UNION ALL

-- -------------- Jotstar --------------
SELECT 
    'Jotstar' AS Platform,                                 -- Platform label
    s.age_group,                                           -- Age group of the users
    s.subscription_plan,                                   -- Subscription plan of the users
    s.user_status,                                         -- Status: Active or Inactive
    s.status_count AS user_count,                          -- Count of users for the status
    ROUND(s.status_count / t.total_count * 100, 2) AS percentage  -- Percentage calculation
FROM 
    (
        SELECT 
            age_group,
            subscription_plan,
            CASE 
                WHEN last_active_date IS NULL THEN 'Active'
                ELSE 'Inactive'
            END AS user_status,                           -- Determine user status
            COUNT(user_id) AS status_count                -- Count users per status
        FROM jotstar_db.subscribers                      -- Data from Jotstar database
        GROUP BY age_group, subscription_plan, user_status
    ) s
    INNER JOIN 
    (
        SELECT 
            age_group,
            subscription_plan,
            COUNT(user_id) AS total_count               -- Total count of users per group
        FROM jotstar_db.subscribers                      -- Data from Jotstar database
        GROUP BY age_group, subscription_plan
    ) t 
    ON s.age_group = t.age_group 
    AND s.subscription_plan = t.subscription_plan
    ORDER BY Platform, age_group, subscription_plan;
    
