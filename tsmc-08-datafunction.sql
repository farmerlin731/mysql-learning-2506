-- ::DATE
-- AT TIME ZONE
-- EXTRACT
-- Thess sql syntax are different between MySQL & Postsql

SELECT
    job_id,
    job_postings_fact.job_posted_date
FROM job_postings_fact
LIMIT 100;

SELECT 'true'::BOOLEAN;

-- end @ 2:21:00