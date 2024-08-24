-- What are the top skills based on salary

SELECT
   skills,
   COUNT (job_postings_fact.job_id) AS num_jobs,
   ROUND (AVG(salary_year_avg), 0)AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
   salary_year_avg IS NOT NULL
   AND job_title_short = 'Data Analyst'
   AND job_work_from_home = TRUE

GROUP BY skills
ORDER BY
   average_salary DESC
LIMIT 25



/*
[
  {
    "skills": "pyspark",
    "num_jobs": "2",
    "average_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "num_jobs": "2",
    "average_salary": "189155"
  },
  {
    "skills": "couchbase",
    "num_jobs": "1",
    "average_salary": "160515"
  },
  {
    "skills": "watson",
    "num_jobs": "1",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "num_jobs": "1",
    "average_salary": "155486"
  },
  {
    "skills": "gitlab",
    "num_jobs": "3",
    "average_salary": "154500"
  },
  {
    "skills": "swift",
    "num_jobs": "2",
    "average_salary": "153750"
  },
  {
    "skills": "jupyter",
    "num_jobs": "3",
    "average_salary": "152777"
  },
  {
    "skills": "pandas",
    "num_jobs": "9",
    "average_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "num_jobs": "1",
    "average_salary": "145000"
  },
  {
    "skills": "golang",
    "num_jobs": "1",
    "average_salary": "145000"
  },
  {
    "skills": "numpy",
    "num_jobs": "5",
    "average_salary": "143513"
  },
  {
    "skills": "databricks",
    "num_jobs": "10",
    "average_salary": "141907"
  },
  {
    "skills": "linux",
    "num_jobs": "2",
    "average_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "num_jobs": "2",
    "average_salary": "132500"
  },
  {
    "skills": "atlassian",
    "num_jobs": "5",
    "average_salary": "131162"
  },
  {
    "skills": "twilio",
    "num_jobs": "1",
    "average_salary": "127000"
  },
  {
    "skills": "airflow",
    "num_jobs": "5",
    "average_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "num_jobs": "2",
    "average_salary": "125781"
  },
  {
    "skills": "jenkins",
    "num_jobs": "3",
    "average_salary": "125436"
  },
  {
    "skills": "notion",
    "num_jobs": "1",
    "average_salary": "125000"
  },
  {
    "skills": "scala",
    "num_jobs": "5",
    "average_salary": "124903"
  },
  {
    "skills": "postgresql",
    "num_jobs": "4",
    "average_salary": "123879"
  },
  {
    "skills": "gcp",
    "num_jobs": "3",
    "average_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "num_jobs": "2",
    "average_salary": "121619"
  }
]
*/