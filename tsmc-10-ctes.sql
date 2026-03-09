-- subqueries 
SELECT * 
FROM (
    SELECT * 
    from job_postings_fact
    WHERE EXTRACT(MONTH from job_postings_fact.job_posted_date) = 2
) AS feb_jobs;


-- CTEs ( temporary result set)
WITH mar_jobs AS(
    SELECT * 
    from job_postings_fact
    WHERE EXTRACT(MONTH from job_postings_fact.job_posted_date) = 3
)
SELECT * FROM mar_jobs;

-- Use CTEs to combine 2 tables.
SELECT 
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN(
    SELECT company_id
    FROM job_postings_fact
    WHERE job_location = 'New York, NY'
)

WITH company_jobs_count AS(
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT 
    company_dim.name AS company_name,
    company_jobs_count.total_jobs 
FROM company_dim
LEFT JOIN company_jobs_count ON company_dim.company_id = company_jobs_count.company_id
ORDER BY company_jobs_count.total_jobs  DESC

-- MORE PRATICE
WITH remote_job_skills AS(
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_poster ON job_poster.job_id = skills_to_job.job_id
    WHERE job_poster.job_work_from_home = 0
    GROUP BY skill_id
    ORDER BY skill_id ASC
)
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    remote_job_skills.skill_count
FROM remote_job_skills
INNER JOIN skills_dim ON remote_job_skills.skill_id = skills_dim.skill_id
GROUP BY
LIMIT 5

-- END @ 2:50:15
