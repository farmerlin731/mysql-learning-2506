-- LEFT JOIN 0.026s 
-- RIGHT JOIN 0.501s
-- INNER JOIN 0.025s
SELECT 
    jobs.job_id,
    jobs.job_title,
    jobs.salary_year_avg,
--    jobs.company_id,
--    company.company_id,
    company.name
FROM 
	job_postings_fact AS jobs
LEFT JOIN company_dim AS company
ON jobs.company_id = company.company_id
LIMIT 1000;

-- INNER JOIN with many-to-many tables
SELECT 
    jobs.job_id,
    jobs.job_title,
    jobs.salary_year_avg,
	s_j_table.skill_id,
    skills.skills
FROM 
	job_postings_fact AS jobs
INNER JOIN skills_job_dim AS s_j_table ON jobs.job_id = s_j_table.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = s_j_table.skill_id
LIMIT 1000;

-- Count the number of jobs in each skill
SELECT 
	skills.skills,
    COUNT(skill_to_job.job_id)
FROM skills_dim AS skills
LEFT JOIN skills_job_dim AS skill_to_job ON skills.skill_id = skill_to_job.skill_id
GROUP BY skills.skills;

-- END @ 1:26:20