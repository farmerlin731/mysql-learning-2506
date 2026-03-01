-- Wildcards are used with the LIKE operator.
-- They r used in WHERE clause.
-- '%' means anything
-- '_' means single character
SELECT DISTINCT
	job_id,job_title,job_title_short,job_location
FROM job_postings_fact
WHERE  
	job_title LIKE '%Business_Analyst%'
LIMIT 100;

-- AS -> give a nick name.
-- U can use it in column and table.
SELECT DISTINCT
	job_id,job_title,job_title_short,
    job_location AS location
FROM job_postings_fact AS jpc


-- Operations
SELECT
    hours_rate AS rate_ori,
    hours_rate -5 AS rate_drop
FROM invoices_face