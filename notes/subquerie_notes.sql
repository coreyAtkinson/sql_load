SELECT *
FROM ( --Subquiry starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs; --Subquery ends here


--Common Table Expressions--
WITH febuary_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
)

SELECT *
FROM febuary_jobs;


--PRACTICE NOTES--

SELECT name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT
      company_id
    FROM
       job_postings_fact
    WHERE
     job_no_degree_mention = true
    ORDER BY
        company_id
);


--Problem: find companies with the most job openings


--Finds number of postings by company_id
WITH company_job_count AS (
SELECT 
    company_id,
    COUNT(*) AS total_jobs --Counts the number of rows
FROM   
    job_postings_fact
GROUP BY
    company_id
)

SELECT
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC
    

