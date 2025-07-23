/* 
Question: What are the most in-demand skills for Data Scientists?
-Join job postings to inner join skills table similar to query 2
-Identify the top 5 in-demand skills for a Data Scientist
-Focus on all job postings, not just remote or per highest salary
-Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills.
*/

SELECT
    COUNT(job_postings_fact.job_id) AS num_jobs_for_skill,
    skills
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist'
    skills
ORDER BY 
    num_jobs_for_skill DESC
LIMIT 5;


