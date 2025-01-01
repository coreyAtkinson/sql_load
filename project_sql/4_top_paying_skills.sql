
--What are the top skills based on salary for data analysts?



SELECT
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
    skill
ORDER BY
    average_yearly_salary DESC
LIMIT 25;





/*
JSON:
[
  {
    "skill": "bitbucket",
    "average_yearly_salary": "189155"
  },
  {
    "skill": "pyspark",
    "average_yearly_salary": "172836"
  },
  {
    "skill": "splunk",
    "average_yearly_salary": "165000"
  },
  {
    "skill": "watson",
    "average_yearly_salary": "160515"
  },
  {
    "skill": "couchbase",
    "average_yearly_salary": "160515"
  },
  {
    "skill": "datarobot",
    "average_yearly_salary": "155486"
  },
  {
    "skill": "gitlab",
    "average_yearly_salary": "154500"
  },
  {
    "skill": "swift",
    "average_yearly_salary": "153750"
  },
  {
    "skill": "pandas",
    "average_yearly_salary": "146139"
  },
  {
    "skill": "elasticsearch",
    "average_yearly_salary": "145000"
  },
  {
    "skill": "golang",
    "average_yearly_salary": "145000"
  },
  {
    "skill": "react",
    "average_yearly_salary": "140500"
  },
  {
    "skill": "databricks",
    "average_yearly_salary": "137813"
  },
  {
    "skill": "linux",
    "average_yearly_salary": "136508"
  },
  {
    "skill": "numpy",
    "average_yearly_salary": "135427"
  },
  {
    "skill": "atlassian",
    "average_yearly_salary": "134302"
  },
  {
    "skill": "db2",
    "average_yearly_salary": "134113"
  },
  {
    "skill": "kubernetes",
    "average_yearly_salary": "132500"
  },
  {
    "skill": "unify",
    "average_yearly_salary": "132500"
  },
  {
    "skill": "jupyter",
    "average_yearly_salary": "128055"
  },
  {
    "skill": "microstrategy",
    "average_yearly_salary": "127913"
  },
  {
    "skill": "twilio",
    "average_yearly_salary": "127000"
  },
  {
    "skill": "kafka",
    "average_yearly_salary": "126667"
  },
  {
    "skill": "scala",
    "average_yearly_salary": "126336"
  },
  {
    "skill": "scikit-learn",
    "average_yearly_salary": "125781"
  }
]
*/