use demo_ch09_0712;

-- DATE
DROP TABLE test1;
create TABLE test1(a DATE);
INSERT INTO test1(a) values('2018-10-01');
INSERT INTO test1(a) values('20181002');
INSERT INTO test1(a) values(20181003);
INSERT INTO test1(a) values(NULL);
select * from test1;

-- TIME
DROP TABLE test2;
create TABLE test2(a TIME);
INSERT INTO test2(a) values('10:10:35');
INSERT INTO test2(a) values('11:11:35');
INSERT INTO test2(a) values('11:11:35');
INSERT INTO test2(a) values('12:10');
INSERT INTO test2(a) values(121235);
INSERT INTO test2(a) values('14');
select * from test2;

-- YEAR
DROP TABLE test3;
create TABLE test3(a YEAR);
INSERT INTO test3(a) values(1901);
INSERT INTO test3(a) values(2155);
INSERT INTO test3(a) values("1902");
INSERT INTO test3(a) values(70);
INSERT INTO test3(a) values(0);
INSERT INTO test3(a) values("0");
select * from test3;


-- DATETIME & TIMESTAMP
DROP TABLE test4;
-- create TABLE test4(a DATETIME, b TIMESTAMP);
-- After 5.6.4
CREATE TABLE test4 (
  id INT PRIMARY KEY AUTO_INCREMENT,
  a DATETIME,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO test4(a) values("2018-01-01 01:10:10");
UPDATE test4 set id=4;
INSERT INTO test4() values();
desc test4;
select * from test4;
SELECT now();
-- +----+---------------------+---------------------+
-- | id | a                   | created_at          |
-- +----+---------------------+---------------------+
-- |  4 | 2018-01-01 01:10:10 | 2025-07-16 22:25:51 |
-- |  5 | NULL                | 2025-07-16 22:25:51 |
-- +----+---------------------+---------------------+



-- Answer for testing
-- +-------------------------------------------------+
-- | title                                           |
-- +-------------------------------------------------+
-- | Jackman Robin was hired on 12th October 2001    |
-- | Edward Taylor was hired on 21st September 2002  |
-- | Dickens Vivian was hired on 29th August 2012    |
-- | Clifford Harry was hired on 10th December 2015  |
-- | Clifford Eliza was hired on 19th October 1998   |
-- | Newman Nancy was hired on 23rd January 2007     |
-- | Clifford Melinda was hired on 29th October 2013 |
-- | Chan Jack was hired on 7th September 2018       |
-- | Gilbert Harley was hired on 17th July 2000      |
-- +-------------------------------------------------+
SELECT DATE_FORMAT(NOW(),"%W,%D-%M-%Y");

SELECT CONCAT(last_name," ",first_name," was hired on ",DATE_FORMAT(hire_date,"%D %M %Y")) as title from employee;
