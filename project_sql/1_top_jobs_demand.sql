/*
My Question: Which kind of data jobs have the highest demand? 
-Identify the top 3 careers in data analysis/science based on the number of postings.
*/

SELECT
    COUNT (job_id) As num_of_posts,
    job_title_short
FROM
    job_postings_fact
GROUP BY
    job_title_short
ORDER BY
    num_of_posts DESC;

/*
Sub-question: How are remote jobs distributed between various data job types?*/

SELECT
    COUNT (job_id) As num_of_posts,
    job_title_short
FROM
    job_postings_fact
WHERE
    job_location = 'Anywhere'
GROUP BY
    job_title_short
ORDER BY
    num_of_posts DESC;






/*
Practice Question: What are the top paying data scientist jobs?
-Identify the top 10 highest paying Data Scientist roles that are available remotely.
-Focuses on job postings with specified salaries (remove NULLs)
-Why? HIghlight top-paying opportunities for Data Scientists and offer insights into the employment landscape
*/

SELECT 
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id =company_dim.company_id
WHERE job_title_short = 'Data Scientist' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;