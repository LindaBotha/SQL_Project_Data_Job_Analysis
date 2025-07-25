# Introduction
This project investigates the Data Science job market in terms of job type, highest paying jobs, skills required and job location options (including remote work options) to help identify the most valuable skills, based on demand and salary, to prioritize for career development.
SQL queries for this evaluation can be found here: [project_sql folder](/project_sql/)

### Note: This is currently a work in progress and not the final version ###

# Background
This project was started as a way of learning how to apply SQL queries to draw valuable insights from extensive data sets. Much gratitude to Luke Barousse for hosting this course and providing extensive datasets.

I am a polymer scientist with extensive experience in handling data, but no experience with coding language, so this was an interesting experiment for me to conduct with data outside of my regular area of expertise, using specifically structured data language.

## Questions to answer:
1. Which kind of data jobs have the highest demand? 
2. What are the typical skills required for these high-demand jobs?
3. What is the optimum career target at the intersection of demand (job availability) and skills required (transferability of my existing experience)?
4. What are the top skills based on salary for my identified career target?
5. What are the most optimal skills to start learning? (high demand and high paying)


# Tools I used
- **SQL** as the main query language
- **PostgreSQL** as the database management system
- **Visual Studio Code** as the integrated development environment (IDE)
- **Git & GitHub** as the version control system and interface for sharing results

# The Analysis
Each query in this project was aimed at answering the 5 questions as outlined above:
### 1. Top demand data jobs
To identify the roles in highest demand, I conducted a simple count of job postings in the comple data base, ordered by the unique job title

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
![Top data science roles](assets/1_demand.png)
*Bar chart visualizing the number job postings per role *

From this data, there are signifcantly more postings for Data Analysts, Engineers and Scientsts, with senior levels of these, as well as other specialized positons having only about ~ 20 % of the available positions comapred to the top three. Since I am new to the world of data, I am not concerned about senior or specialized positions, so I decided to limit my further queries to the top 3 roles ranked by demand.

| Rank | **Job Title**                | **Number of Posts** |
|------|------------------------------|----------------------|
| 1    | **Data Analyst**             | **196,593**          |
| 2    | **Data Engineer**            | **186,679**          |
| 3    | **Data Scientist**           | **172,726**          |
| 4    | **Business Analyst**         | **49,160**           |
| 5    | **Software Engineer**        | **45,019**           |
| 6    | **Senior Data Engineer**     | **44,692**           |
| 7    | **Senior Data Scientist**    | **37,076**           |
| 8    | **Senior Data Analyst**      | **29,289**           |
| 9    | **Machine Learning Engineer**| **14,106**           |
| 10   | **Cloud Engineer**           | **12,346**           |

I am interested in remote work, so next I wanted to evaluate how remote work opportunities were distributed between these positions.

# What I learned


# Conclusions
## Insights


## Closing thoughts
