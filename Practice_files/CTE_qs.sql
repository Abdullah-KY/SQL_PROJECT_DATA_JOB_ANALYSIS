WITH top5_remote_skills AS (
    SELECT 
        skill_to_job.skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skill_to_job 
        INNER JOIN job_postings_fact AS job_postings 
        ON job_postings.job_id=skill_to_job.job_id
    WHERE 
        job_work_from_home= TRUE
    GROUP BY
        skill_id
    ORDER BY 
        skill_count DESC 
    LIMIT 5
)

SELECT 
    skills.skill_id,
    skills.skills AS skill_name,
    top5_remote_skills.skill_count
FROM
    top5_remote_skills
    INNER JOIN skills_dim AS skills 
    ON skills.skill_id=top5_remote_skills.skill_id