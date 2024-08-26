# Introduction 📊💻

This project is part of the SQL course by [Luke Barousse](https://github.com/lukebarousse) and [Kelly Adams](https://github.com/kellyadams), where we analyzed the job market for data-related roles, exploring various aspects such as salaries, required skills, locations, and more.

The course provides all the necessary knowledge, starting from the basics and progressing to more complex concepts like joins, CASE expressions, and Common Table Expressions (CTEs). Alongside SQL, it also offers valuable insights into using Git and VS Code for version control and project management.

Luke's clear and engaging teaching style makes learning SQL approachable and keeps you motivated to build your skills further.

For a detailed review of the queries, please check out [project_sql](/project_sql/) 📂.

# Background

In this project, we aim to answer the following key questions:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most valuable skills to learn for maximizing career potential?

# Tools

+ SQL
+ Postgres SQL
+ Visual studio Code
+ Git & GitHub

# The Analysis

The following queries will focus on **Data Analyst** roles.

### 1. What are the top-paying roles for Data Analysts?

This query allows us to filter by company, salary, and location, identifying the highest-paid roles for Data Analysts.

```sql
SELECT
   job_id,
   name AS company_name,
   job_title,
   salary_year_avg,
   job_country,
   EXTRACT (MONTH FROM job_posted_date) AS month_posted

FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
   salary_year_avg IS NOT NULL
   AND job_title_short = 'Data Analyst'
   AND job_location = 'Anywhere'
   
ORDER BY
   salary_year_avg DESC
LIMIT 25;
```

- The salaries for Data Analyst roles in this dataset range from $165,000 to $650,000 per year.
- Job titles like Director of Analytics and Principal Data Analyst consistently rank among the highest-paying positions, with salaries often exceeding $200,000. 
- Major tech companies like Meta, Pinterest, and Uber are among the top employers offering competitive salaries for data-related roles. For instance, Meta offers $336,500 for a Director of Analytics, demonstrating that tech giants continue to be leaders in compensation for data professionals.

![Average Salary by Company](assets/Average_Salary_by_Company.png)

### 2. What skills are required for these top-paying jobs?



```sql
WITH top_paying_jobs AS (
   SELECT
      job_id,
      name AS company_name,
      job_title,
      salary_year_avg

   FROM job_postings_fact
   LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
   WHERE 
      salary_year_avg IS NOT NULL
      AND job_title_short = 'Data Analyst'
      AND job_location = 'Anywhere'
      
   ORDER BY
      salary_year_avg DESC
   LIMIT 10
   )

SELECT 
   top_paying_jobs. *,
   skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
   salary_year_avg DESC
```

### 3. What skills are most in demand for data analysts?
### 4. Which skills are associated with higher salaries?
### 5. What are the most valuable skills to learn for maximizing career potential?


# What I learned


# Conclusions
