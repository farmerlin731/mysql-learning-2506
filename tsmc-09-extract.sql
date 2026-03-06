-- https://lukeb.co/sql_chatbot
-- extract some data into new table
CREATE TABLE jan_jobs AS
    SELECT * from job_postings_fact
        WHERE EXTRACT(MONTH from job_postings_fact.job_posted_date) = 1;


-- CASE expression
SELECT
    job_postings_fact.job_title_short,
    job_postings_fact.job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN  'Remote'
        WHEN job_location = 'New York, NY' THEN  'Local'
        ELSE  'Onsite'
    END AS location_category
FROM
    job_postings_fact;


SELECT
    Count(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN  'Remote'
        WHEN job_location = 'New York, NY' THEN  'Local'
        ELSE  'Onsite'
    END AS location_category
FROM
    job_postings_fact
GROUP BY location_category;

-- end @ 2:31:00