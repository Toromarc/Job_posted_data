--Question: What are the most in-demand skills for data analysts?

SELECT
   skills,
   COUNT (job_postings_fact.job_id) AS num_jobs
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
   job_title_short = 'Data Analyst'
   AND job_work_from_home = TRUE


GROUP BY skills
ORDER BY
   num_jobs DESC
LIMIT 5
