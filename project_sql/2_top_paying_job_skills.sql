/* Question: What skills are required for the top-paying Data jobs?
- Use the top 20 highest-paying Data jobs from my first query.
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
        job_title_short IN ('Data Analyst', 'Data Scientist', 'Data Engineer') AND
        job_location= 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 20
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







/* 
Top 4 High-Paying Skills in Top-Paying Remote Data Jobs:
- Python: 13+
- SQL: 10+
- Spark: 7+
- Hadoop: 5+


[
  {
    "job_id": 40145,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist - Business Analytics",
    "salary_year_avg": "525000.0",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "datarobot"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title": "Head of Battery Data Science",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title": "Head of Battery Data Science",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title": "Head of Battery Data Science",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title": "Director of Data Science",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title": "Director of Data Science",
    "salary_year_avg": "300000.0",
    "skills": "pandas"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title": "Director of Data Science",
    "salary_year_avg": "300000.0",
    "skills": "numpy"
  },
  {
    "job_id": 270455,
    "company_name": "Durlston Partners",
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "company_name": "Durlston Partners",
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "c"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "scala"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "sql"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "python"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "nosql"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "r"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "sas"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "matlab"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "azure"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "databricks"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "aws"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "redshift"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "oracle"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "spark"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "tableau"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "sas"
  },
  {
    "job_id": 178888,
    "company_name": "Teradata",
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "salary_year_avg": "288000.0",
    "skills": "qlik"
  },
  {
    "job_id": 1177572,
    "company_name": "Home Depot / THD",
    "job_title": "Data Science Manager, Online Customer Experience Intelligence (Remote)",
    "salary_year_avg": "280000.0",
    "skills": "sql"
  },
  {
    "job_id": 1177572,
    "company_name": "Home Depot / THD",
    "job_title": "Data Science Manager, Online Customer Experience Intelligence (Remote)",
    "salary_year_avg": "280000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1177572,
    "company_name": "Home Depot / THD",
    "job_title": "Data Science Manager, Online Customer Experience Intelligence (Remote)",
    "salary_year_avg": "280000.0",
    "skills": "tableau"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "sql"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "python"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "java"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "aws"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "spark"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "airflow"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 158782,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "skills": "tableau"
  }
]
*/