/*
What are the top skills based on salary?
-Look at the average salary associated with each skill for Data Scientist positions
-FOcuses on roles with specified salaries, regardless of the location
-Why? it reveals the most financially rewarding skills to acquire or improve
*/

SELECT
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_sal_for_skill,
    skills
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist' 
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY 
    avg_sal_for_skill DESC
LIMIT 25;

/*  Surprising Insights
💰 Productivity Tools Reign

Asana ($215K) and Airtable ($201K) top the list - project management skills are premium!

🧬 Niche Languages Pay

Elixir ($171K) and Lua ($171K) show specialization beats popularity

🤖 AI Tools Premium

Hugging Face ($161K) reflects the AI boom's impact on salaries

Strategic Career Insights
🎯 The "Soft Skills" Goldmine
Productivity and collaboration tools (Asana, Airtable, Slack) dominate the top spots.
The insight: Companies value data scientists who can lead projects and coordinate teams, not just code.

⚡ Specialization Strategy
Niche programming languages (Elixir, Lua, Solidity) command premiums.
The takeaway: Being the go-to expert in a specialized technology can be more valuable than broad knowledge.

🚀 Future-Proof Skills
AI/ML tools (Hugging Face, Watson) and modern data tools (Neo4j, Airflow) are well-represented.
The lesson: Stay current with emerging technologies in the AI ecosystem.*/