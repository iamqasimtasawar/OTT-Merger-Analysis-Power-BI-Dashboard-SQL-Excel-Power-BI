-- Fetching total number of contents per platform along with language and content type
SELECT 
    'LioCinema' AS Platform,                          -- Labeling platform as 'Lio'
    COUNT(content_id) AS Total_Content,         -- Counting total contents per language & type
    content_type,                               -- Content type (Movie, Series)
    language                                    -- Content language (Hindi, English, etc.)
FROM 
    liocinema_db.contents                        -- Fetching data from LioCinema database
GROUP BY 
    content_type, language                      -- Grouping by content type and language

UNION ALL

SELECT 
    'Jotstar' AS Platform,                      -- Labeling platform as 'Jotstar'
    COUNT(content_id) AS Total_Content,         -- Counting total contents per language & type
    content_type,                               -- Content type (Movie, Series)
    language                                    -- Content language (Hindi, English, etc.)
FROM 
    jotstar_db.contents                         -- Fetching data from Jotstar database
GROUP BY 
    content_type, language                      -- Grouping by content type and language

ORDER BY 
    Total_Content DESC;                         -- Sorting by content count in descending order
