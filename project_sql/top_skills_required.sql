-- 2. What are the skills required for those roles
WITH skills_required AS (
   SELECT
      job.job_id,
      job.job_title,
      job.salary_year_avg,
      job.job_country,
      skills.skill_id

   FROM job_postings_fact AS job

   INNER JOIN skills_job_dim AS skills on skills.job_id = job.job_id

   WHERE 
      job.salary_year_avg IS NOT NULL
      AND job.job_title_short = 'Data Analyst'
      AND job.job_work_from_home = TRUE
   ORDER BY
      job.salary_year_avg DESC
   limit 25
)

SELECT  
   COUNT (job_id) AS num_jobs
   skill_id
FROM skills_dim