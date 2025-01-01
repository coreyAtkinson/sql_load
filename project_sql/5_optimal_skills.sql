--What is the overal best skill to learn? (in-demand and high pay)


WITH demand AS (
    SELECT
        skills_dim.skill_id,
        skills AS skill,
        COUNT(skills) AS number_of_occurences
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        (job_location LIKE '%Chicago%' OR
        job_work_from_home IS TRUE) AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), high_pay AS (
    SELECT
        skills_dim.skill_id,
        skills AS skill,
        ROUND(AVG(salary_year_avg), 0) AS average_yearly_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        (job_location LIKE '%Chicago%' OR
        job_work_from_home IS TRUE) AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
)


SELECT 
    demand.skill_id,
    demand.skill,
    number_of_occurences,
    average_yearly_salary
FROM demand
INNER JOIN high_pay ON demand.skill_id = high_pay.skill_id
WHERE
    number_of_occurences > 10
ORDER BY
    average_yearly_salary DESC,
    number_of_occurences DESC
LIMIT 25