# Introduction
This project investigates the Data job market in terms of job type, highest paying jobs, skills required and job location options (including remote work) to help identify the most valuable skills, based on demand and salary, to prioritize for career development.
SQL queries for this evaluation can be found here: [project_sql folder](/project_sql/)

### Note: This is currently a work in progress and not the final version ###

# Background
This project was started as a way of learning how to apply SQL queries to draw valuable insights from extensive data sets. Much gratitude to Luke Barousse for hosting this course and providing the datasets.

I am a polymer scientist with extensive experience in handling data, but no experience with coding language, so this was an interesting experiment for me to conduct with data outside of my regular area of expertise, using specifically structured data query language.

## Questions to answer:
1. Which kind of data jobs have the highest demand? 
2. What are the typical skills required for these high-demand jobs?
3. What is the optimum career target at the intersection of demand (job availability) and skills required (my interest and transferability of prior experience)?
4. What are the top skills based on salary and remote work opportunities for my identified career target?
5. What are the most optimal skills to start learning? (high demand and high paying)


# Tools I used
- **SQL** as the main query language
- **PostgreSQL** as the database management system
- **Visual Studio Code** as the integrated development environment (IDE)
- **Git & GitHub** as the version control system and interface for sharing results

# The Analysis
Each query in this project was aimed at answering the 5 questions as outlined above:
### 1. Top demand data jobs
To identify the roles in highest demand, I conducted a simple count of job postings in the complete data base, ordered by the unique job title. 

```sql
SELECT
    COUNT (job_id) As num_of_posts,
    job_title_short
FROM
    job_postings_fact
GROUP BY
    job_title_short
ORDER BY
    num_of_posts DESC;
```
Since I am also specifically interested in remote work, I applied a second query to compare and contrast with the first one as I wanted to evaluate how the distribution changed for remote work opportunities. To do this, I simply modified the existing query with the clause:

``` sql
WHERE
    job_location = 'Anywhere'
```
directly preceding the 'GROUP BY' statement.

![Top data science roles](assets/1_demand_all.png)              ![Top remote data science roles](assets/1_demand_remote.png)
*Bar chart visualizing the number of job postings per role*     *Bar chart visualizing the number of remote job postings per role*



**Total number of data job postings per job type**
| Rank | Job Title | Number of Posts |
|------|-----------|-----------------|
| 1 | Data Analyst | 196,593 |
| 2 | Data Engineer | 186,679 |
| 3 | Data Scientist | 172,726 |
| 4 | Business Analyst | 49,160 |
| 5 | Software Engineer | 45,019 |
| 6 | Senior Data Engineer | 44,692 |
| 7 | Senior Data Scientist | 37,076 |
| 8 | Senior Data Analyst | 29,289 |
| 9 | Machine Learning Engineer | 14,106 |
| 10 | Cloud Engineer | 12,346 |

**Total number of data job postings per job type**
| Rank | Job Title | Number of Posts |
|------|-----------|-----------------|
| 1 | Data Engineer | 21,261 |
| 2 | Data Scientist | 14,534 |
| 3 | Data Analyst | 13,331 |
| 4 | Senior Data Engineer | 6,564 |
| 5 | Senior Data Scientist | 3,809 |
| 6 | Software Engineer | 2,918 |
| 7 | Business Analyst | 2,786 |
| 8 | Senior Data Analyst | 2,352 |
| 9 | Machine Learning Engineer | 1,480 |
| 10 | Cloud Engineer | 571 |


From this data, there's a significant number postings for Data Analysts, Data Engineers and Data Scientsts, with senior levels of these, as well as other specialized positons having only about ~ 20 % of the available positions compared to the top 3. Since I am new to the world of data, I am not concerned about senior or specialized positions, so I decided to limit my subsequent queries to the top 3 roles ranked by demand. The top 3 roles are also the most abundant in the remote job subset but the breakdown changes slightly, where Data Engineers have signifcantly more remote job opportunities than Data Scientists or Data Analysts. Remote jobs represent only about 5-10 % of the total available jobs, suggesting a general preference for a physical presence or hybrid work arrangement by companies offering data jobs. 

### 2. Typical skills required in the top 3 data jobs
A quick check on the unique skills represented in the database:
``` sql
SELECT DISTINCT skills from skills_dim
```
revealed 252 distinct skills distributed among all the data jobs. To deal with this, I tried 3 subqueries, one for each position of interest to compare and contrast their skills distribution:

``` sql
SELECT 
    COUNT (job_postings_fact.job_id) AS num_jobs_per_skill,
    skills_dim.skills,
    skills_dim.type
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short IN ('Data Engineer') AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
GROUP BY 
skills,
type
ORDER BY
num_jobs_per_skill DESC
LIMIT 10;
```
Replacing the job title in subsequent queries to provide a comparable breakdown.

![Top Data Engineer skills](assets/Data_Eng_skills.png)            ![Top Data Scientist skills](assets/Data_Sci_skills.png)
*Pie chart for top Data Engineer skills*                            *Pie chart for top Data Scientist skills* 
                          

![Top Data Analyst skills](assets/Data_Ana_skills.png)
*Pie chart visualizing the top skills required in Data Analyst postings*


# What I learned


# Conclusions
## Insights


## Closing thoughts
