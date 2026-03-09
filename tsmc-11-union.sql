-- UNION  combines results from 2 or more select statements
-- start @ 2:50:16
-- The difference between UNION & UNION ALL

SELECT job_title_short,company_id,job_location,job_posted_date FROM jan_jobs
UNION SELECT job_title_short,company_id,job_location,job_posted_date FROM feb_jobs;

-- Pratice @ 2:54:54

SELECT 
    job_title_short,
    job_location,
    job_via,
    job_posted_date,
    salary_year_avg
FROM (
    SELECT * FROM jan_jobs
    UNION ALL SELECT * FROM feb_jobs
    UNION ALL SELECT * FROM mar_jobs
) AS quarter_1_job_posting
WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC