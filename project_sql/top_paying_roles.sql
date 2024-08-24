
-- 1.What are the top paying roles for Data Analyst?

SELECT
   job_id,
   job_title,
   salary_year_avg,
   job_country

FROM job_postings_fact
WHERE 
   salary_year_avg IS NOT NULL
   AND job_title_short = 'Data Analyst'
   AND job_work_from_home = TRUE
ORDER BY
   salary_year_avg DESC
limit 25;

