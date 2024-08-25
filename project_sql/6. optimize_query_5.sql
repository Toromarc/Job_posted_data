SELECT
   skills_dim.skills,
   COUNT (job_postings_fact.job_id) AS num_jobs,
   ROUND (AVG (job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id 
WHERE
   job_postings_fact.job_work_from_home = TRUE
   AND job_postings_fact.job_title = 'Data Analyst'
   AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
   skills_dim.skill_id
HAVING
   COUNT (job_postings_fact.job_id) > 10
ORDER BY
   avg_salary DESC,
   num_jobs DESC


