/* Question: What are the top-paying Data Analyst, Data Scientist, Data Engineer jobs?
- Identify the top 20 highest paying Data roles that are available remotely.
- Focuses on job postings with specified salaries (excluding nulls).
- Why? Highlight the top paying jobs for Data Managing and Manipulating, offering insights
    into current market demand and salary trends */

SELECT
    job_id,
    companies.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact AS job_postings
LEFT JOIN company_dim AS companies 
ON job_postings.company_id = companies.company_id 
WHERE
    job_title_short IN ('Data Analyst', 'Data Scientist', 'Data Engineer') AND
    job_location= 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 20;