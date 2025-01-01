
--What are the most in demand skills for data anylists near Chicago or remote?


SELECT
skills AS skill,
COUNT(skills) AS number_of_occurences
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    (job_location LIKE '%Chicago%' OR
    job_work_from_home IS TRUE)
GROUP BY
    skill
ORDER BY
    number_of_occurences DESC
LIMIT 10