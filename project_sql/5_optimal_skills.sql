/*my own query - conscise */

SELECT
    skills_dim.skills,
    COUNT (skills_job_dim.job_id) AS num_jobs_for_skill,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY
    skills_dim.skill_id
HAVING (COUNT (skills_job_dim.job_id))> 100
ORDER BY
    avg_salary DESC


/*my own query - longer*/
WITH skills_demand AS(
SELECT
    COUNT(job_postings_fact.job_id) AS num_jobs_for_skill,
    skills,
    skills_dim.skill_id
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY
    skills_dim.skill_id
HAVING (COUNT(job_postings_fact.job_id)) > 100
),

--Note that here you don't have to use WITH again, just a comma to add the second CTE (essentially what we did in query 4)

 avg_salary AS (
SELECT
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_sal_for_skill,
    skills,
    skills_dim.skill_id
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY 
    skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    num_jobs_for_skill,
    avg_sal_for_skill
FROM
    skills_demand
INNER JOIN avg_salary ON avg_salary.skill_id = skills_demand.skill_id
ORDER BY
    avg_sal_for_skill DESC




/*
What are the most optimal skills to learn, i.e. the optimal combination of high demand and high paying?
-Identify skills in high demand and associated with high average salaries for Data Scientist roles
-Focus on remote positions and specified salaries
-Why? This shortlists target skills that offer job security and financial benefits, offering strategic insights for my career path
*/

WITH skills_demand AS(
SELECT
    COUNT(job_postings_fact.job_id) AS num_jobs_for_skill,
    skills,
    skills_dim.skill_id
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
) ,

--Note that here you don't have to use WITH again, just a comma to add the second CTE (essentially what we did in query 4)

 avg_salary AS (
SELECT
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_sal_for_skill,
    skills,
    skills_dim.skill_id
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY 
    skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    num_jobs_for_skill,
    avg_sal_for_skill
FROM
    skills_demand
INNER JOIN avg_salary ON avg_salary.skill_id = skills_demand.skill_id
ORDER BY
    num_jobs_for_skill DESC
LIMIT 25;

-- More concise alternative query:

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT (skills_job_dim.job_id) AS num_jobs_for_skill,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
ORDER BY
    num_jobs_for_skill DESC
LIMIT 25