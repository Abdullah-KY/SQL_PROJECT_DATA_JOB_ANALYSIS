/* Question: What skills are required for the top-paying Data Analyst jobs?
- Use the top 10 highest-paying Data jobs from my first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at what high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        companies.name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact AS job_postings
    LEFT JOIN company_dim AS companies 
    ON job_postings.company_id = companies.company_id 
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location= 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_jobs.*,
    skills
FROM 
    top_paying_jobs AS top_jobs
INNER JOIN skills_job_dim ON top_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
