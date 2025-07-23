SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.salary_year_avg,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_posted_date::DATE
FROM (
    SELECT* FROM january_jobs
    UNION ALL
    SELECT* FROM february_jobs
    UNION ALL 
    SELECT* FROM march_jobs
) AS quarter1_job_postings
WHERE
    salary_year_avg>70000
ORDER BY salary_year_avg DESC