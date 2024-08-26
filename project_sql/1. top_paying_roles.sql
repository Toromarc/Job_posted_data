-- 1.What are the top paying roles for Data Analyst?

SELECT
   job_id,
   name AS company_name,
   job_title,
   salary_year_avg,
   job_country

FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
   salary_year_avg IS NOT NULL
   AND job_title_short = 'Data Analyst'
   AND job_location = 'Anywhere'
   
ORDER BY
   salary_year_avg DESC
LIMIT 15
;

