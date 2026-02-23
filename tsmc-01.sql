-- @ terminal
-- source tsmc-01.sql
USE test_db;

-- CREATE
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100)
);

-- INSERT
INSERT INTO users (name, age, email)
VALUES ('Tom', 25, 'tom@gmail.com'),('Mary', 17, 'mary@gmail.com');

-- SEARCH
SELECT * FROM users;

-- WHERE
SELECT * FROM users WHERE age > 20;

-- ORDER
SELECT * FROM users ORDER BY age DESC;

-- UPDATE
UPDATE users
SET age = 30
WHERE name = 'Tom';

-- DELETE
DELETE FROM users
WHERE id = 1;