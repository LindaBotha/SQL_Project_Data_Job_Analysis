/*
Question: What skills are required for the top=paying data analyst jobs?
-Use the top 10 highest paying Data Analsyt jobs from the first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with their target salaries
*/

WITH top_jobs AS (
    SELECT 
        job_id,
        job_title_short,
        salary_year_avg,
        company_dim.name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id =company_dim.company_id
    WHERE 
        job_title_short = 'Data Scientist' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
    salary_year_avg DESC
    LIMIT 10
    )
SELECT 
    top_jobs.*,
    skills,
    type
FROM top_jobs
INNER JOIN skills_job_dim ON top_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*Key Insights
Most In-Demand:
SQL appears in 4 roles

Programming Dominance:
13 programming skills mentioned

ML Libraries Critical:
TensorFlow, PyTorch, Keras all featured

Cloud Essential:
AWS, GCP, Azure in high-paying roles

Salary Range:
$300K - $550K for top positions

Big Data Tools:
Spark, Hadoop for large-scale processing

Strategic Recommendations

Essential Skills to Master
SQL - Foundation for data manipulation
Python - Core programming language
Cloud platforms (AWS/GCP) - Infrastructure knowledge
ML frameworks (TensorFlow/PyTorch) - AI implementation

High-Value Combinations
SQL + Python + Cloud = $400K+ potential
Java + Spark + Big Data tools for scale
Multiple ML libraries show depth
Analyst tools (Tableau) add business value

[
  {
    "job_id": 40145,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "550000.0",
    "company_name": "Selby Jennings",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 40145,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "550000.0",
    "company_name": "Selby Jennings",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 1714768,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "525000.0",
    "company_name": "Selby Jennings",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "java",
    "type": "programming"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "cassandra",
    "type": "databases"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "spark",
    "type": "libraries"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "hadoop",
    "type": "libraries"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "tensorflow",
    "type": "libraries"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "keras",
    "type": "libraries"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "pytorch",
    "type": "libraries"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "scikit-learn",
    "type": "libraries"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "datarobot",
    "type": "analyst_tools"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Walmart",
    "skills": "scala",
    "type": "programming"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Walmart",
    "skills": "java",
    "type": "programming"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Walmart",
    "skills": "spark",
    "type": "libraries"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Walmart",
    "skills": "tensorflow",
    "type": "libraries"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Walmart",
    "skills": "pytorch",
    "type": "libraries"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Walmart",
    "skills": "kubernetes",
    "type": "other"
  },
  {
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Lawrence Harvey",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Lawrence Harvey",
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Lawrence Harvey",
    "skills": "gcp",
    "type": "cloud"
  },
  {
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Storm4",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Storm4",
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Storm4",
    "skills": "numpy",
    "type": "libraries"
  }
]*/

