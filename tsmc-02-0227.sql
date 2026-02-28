-- Link: lukeb.co/sql_jobs_db
-- Short cut : ctrl + enter
SELECT * FROM job_postings_fact;

-- DISTINCT
SELECT DISTINCT
	job_title_short
FROM job_postings_fact

-- WHERE(filter)
SELECT DISTINCT
	job_title_short,job_location,job_via,salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > 90000;

-- Multi-Line comment /* something */

-- ORDER BY (null is the smallest) (ASC/DESC)
SELECT DISTINCT
	job_title_short,job_location,job_via,salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > 100000
ORDER BY salary_year_avg ASC
LIMIT 100;

-- NOT & '<>'
SELECT DISTINCT
	job_title_short,job_location,job_via,salary_year_avg
FROM job_postings_fact
WHERE NOT job_via <> 'via Indeed'
ORDER BY salary_year_avg
LIMIT 100;

-- AND / OR / BETWEEN for combining condition
-- Use () to control conditions!
SELECT DISTINCT
	job_title_short,job_location,job_via,salary_year_avg
FROM job_postings_fact
WHERE  
	salary_year_avg BETWEEN 100000 AND 200000
	AND job_via = 'via Indeed'
ORDER BY salary_year_avg;


-- IN
SELECT DISTINCT
	job_title_short,job_location,job_via,salary_year_avg
FROM job_postings_fact
WHERE  
	job_title_short IN ('Data Scientist','Cloud Engineer')
ORDER BY salary_year_avg;

-- END @ 45:32