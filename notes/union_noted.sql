--UNION: combines results from two or more SELECT statements
--need to have same amount of colomns and have matching data types
--gets ride of duplicate rows
--all rows are unique

/*
Syntax:

SELECT colomn_name
FROM table_one

UNION

SELECT column_name
FROM table_two

*/

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    febuary_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

--UNION ALL: Same as UNION, but returns all rows (even duplicates!)




--PRACTICE PROBLEM:

SELECT
    job_title_short,
    skills.skills AS skill,
    skills.type AS skill_type

FROM january_jobs
LEFT JOIN skills_job_dim AS jobs_to_skills ON jobs_to_skills.job_id = january_jobs.job_id
LEFT JOIN skills_dim AS skills ON skills.skill_id = jobs_to_skills.skill_id

UNION ALL

SELECT
    job_title_short,
    skills.skills AS skill,
    skills.type AS skill_type

FROM febuary_jobs
LEFT JOIN skills_job_dim AS jobs_to_skills ON jobs_to_skills.job_id = febuary_jobs.job_id
LEFT JOIN skills_dim AS skills ON skills.skill_id = jobs_to_skills.skill_id

UNION ALL

SELECT
    job_title_short,
    skills.skills AS skill,
    skills.type AS skill_type

FROM march_jobs
LEFT JOIN skills_job_dim AS jobs_to_skills ON jobs_to_skills.job_id = march_jobs.job_id
LEFT JOIN skills_dim AS skills ON skills.skill_id = jobs_to_skills.skill_id

