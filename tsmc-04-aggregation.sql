-- Aggregation : 聚合
-- sum / count / avg / max / min ()
-- used in group by / having

-- basic
SELECT 
	SUM(salary_year_avg) AS salary_sum,
    COUNT(*) AS count_rows,
    COUNT(DISTINCT job_title_short) AS distinct_jobs,
    MAX(salary_year_avg) AS max_salary
FROM 
	job_postings_fact
WHERE
	job_title_short = 'Data Analyst';


-- Plus GROUP BY
SELECT 
    job_title AS title,
    AVG(salary_year_avg) AS salary_avg,
    MAX(salary_year_avg) AS salary_max
FROM 
	job_postings_fact
GROUP BY
	job_title_short
ORDER BY
	salary_avg DESC;

-- HAVING
-- u can't use aggregate function in 'WHERE' 
SELECT 
    job_title AS title,
    COUNT(job_title_short) AS job_count,
    AVG(salary_year_avg) AS salary_avg,
    MAX(salary_year_avg) AS salary_max
FROM 
	job_postings_fact
GROUP BY
	job_title_short
HAVING
	salary_avg > 100000
ORDER BY
	salary_avg DESC;

-- NULL
SELECT 
    job_title AS title,
    salary_year_avg
FROM 
	job_postings_fact
WHERE
	salary_year_avg IS NOT null
ORDER BY
	salary_year_avg ASC;

-- END @ 1:10:08