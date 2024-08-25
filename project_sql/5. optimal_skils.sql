-- What are the most optimal skill to learn?
-- (Optimal-> High demand and High paying)

WITH skills_demand AS (
   SELECT
      skills_dim.skill_id,
      skills_dim.skills,
      COUNT (skills_job_dim.job_id) AS num_jobs
   FROM job_postings_fact
   INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
   INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
   WHERE 
      job_postings_fact.job_title = 'Data Analyst'
      AND job_postings_fact.job_work_from_home = TRUE
      AND job_postings_fact.salary_year_avg IS NOT NULL
   GROUP BY 
      skills_dim.skill_id
 
), salary_average AS (
   SELECT
      skills_job_dim.skill_id,
      ROUND (AVG(job_postings_fact.salary_year_avg), 0) AS average_salary
   FROM job_postings_fact
   INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
   WHERE
      job_postings_fact.salary_year_avg IS NOT NULL
      AND job_postings_fact.job_title = 'Data Analyst'
      AND job_postings_fact.job_work_from_home = TRUE
   GROUP BY
      skills_job_dim.skill_id 
)

SELECT
   skills_demand.skills,
   skills_demand.num_jobs,
   ROUND (salary_average.average_salary,0) AS average_salary
FROM skills_demand
INNER JOIN salary_average ON skills_demand.skill_id = salary_average.skill_id
WHERE 
   num_jobs > 10
ORDER BY
   average_salary DESC,
   num_jobs DESC