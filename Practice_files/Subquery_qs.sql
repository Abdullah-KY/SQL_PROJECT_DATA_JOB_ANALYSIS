SELECT 
    company_name,
    job_count,
    CASE 
        WHEN job_count< 10 THEN 'Small'
        WHEN job_count>= 10 AND job_count<50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM (
    SELECT 
        company_dim.name AS company_name,
        COUNT(*) AS job_count
    FROM 
        job_postings_fact AS job_postings
        LEFT JOIN company_dim
        ON job_postings.company_id=company_dim.company_id
    GROUP BY 
        company_dim.name  
) AS job_counts
ORDER BY
        job_count DESC;
