-- start @ 1:44:20
-- int/varchar(unlimited:text)/boolean/timestamp/numeric(pricision)

CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    status VARCHAR(50)
);

-- insert data
INSERT INTO job_applied (job_id, application_sent_date, custom_resume, resume_file_name, status)
VALUES
(101, '2026-02-10', TRUE,  'resume_backend_v1.pdf', 'Applied'),
(102, '2026-02-12', FALSE, 'resume_general.pdf',    'Rejected'),
(103, '2026-02-15', TRUE,  'resume_devops_v2.pdf',  'Interview'),
(104, '2026-02-18', TRUE,  'resume_java_v3.pdf',    'Offer'),
(105, '2026-02-20', FALSE, 'resume_general.pdf',    'Applied');



-- add column
ALTER TABLE job_applied
ADD contact VARCHAR(50);

-- modify the value
UPDATE job_applied
SET contact = "Farmer Lin"
WHERE job_id = 102;

UPDATE job_applied
SET contact = "Merry Lin"
WHERE job_id = 103;

UPDATE job_applied
SET contact = "Cookie Lin"
WHERE job_id = 104;

-- change type / set default / cancel default

-- read
SELECT * FROM job_applied;

-- End @ 2:00:00