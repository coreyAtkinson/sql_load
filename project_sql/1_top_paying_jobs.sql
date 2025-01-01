--What are the top-paying jobs for Data Analysts?

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    (
        job_location LIKE '%Chicago%' OR 
        job_location = 'Anywhere'
    )
ORDER BY
    salary_year_avg DESC
