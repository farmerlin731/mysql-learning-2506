use demo_ch13_0722;

-- stupid merge
select * from orders where customer_id=(select id from customers where email = "roj@gmail.com");

-- use foreign key
-- inner join (overlap)
select * from customers inner join orders where customers.id=orders.customer_id; 
-- +----+------------+-----------+----------------+----+------------+--------+-------------+
-- | id | first_name | last_name | email          | id | order_date | amount | customer_id |
-- +----+------------+-----------+----------------+----+------------+--------+-------------+
-- |  1 | Robin      | Jackman   | roj@gmail.com  |  1 | 2001-10-12 |  99.12 |           1 |
-- |  1 | Robin      | Jackman   | roj@gmail.com  |  3 | 2001-10-13 |  12.19 |           1 |
-- |  2 | Taylor     | Edward    | taed@gmail.com |  2 | 2001-09-21 | 110.99 |           2 |
-- |  3 | Vivian     | Dickens   | vidi@gmail.com |  4 | 2001-11-29 |  88.09 |           3 |
-- |  4 | Harley     | Gilbert   | hgi@gmail.com  |  5 | 2001-11-11 | 205.01 |           4 |
-- |  4 | Harley     | Gilbert   | hgi@gmail.com  |  6 | 2025-07-25 |  66.66 |           4 |
-- +----+------------+-----------+----------------+----+------------+--------+-------------+

select first_name,last_name,SUM(amount) as total_amount from customers inner join orders where customers.id=orders.customer_id group by customers.id ; 
-- +------------+-----------+--------------+
-- | first_name | last_name | total_amount |
-- +------------+-----------+--------------+
-- | Robin      | Jackman   |       111.31 |
-- | Taylor     | Edward    |       110.99 |
-- | Vivian     | Dickens   |        88.09 |
-- | Harley     | Gilbert   |       271.67 |
-- +------------+-----------+--------------+

-- left join
select * from customers left join orders on customers.id = orders.customer_id;
-- +----+------------+-----------+----------------+------+------------+--------+-------------+
-- | id | first_name | last_name | email          | id   | order_date | amount | customer_id |
-- +----+------------+-----------+----------------+------+------------+--------+-------------+
-- |  1 | Robin      | Jackman   | roj@gmail.com  |    1 | 2001-10-12 |  99.12 |           1 |
-- |  1 | Robin      | Jackman   | roj@gmail.com  |    3 | 2001-10-13 |  12.19 |           1 |
-- |  2 | Taylor     | Edward    | taed@gmail.com |    2 | 2001-09-21 | 110.99 |           2 |
-- |  3 | Vivian     | Dickens   | vidi@gmail.com |    4 | 2001-11-29 |  88.09 |           3 |
-- |  4 | Harley     | Gilbert   | hgi@gmail.com  |    5 | 2001-11-11 | 205.01 |           4 |
-- |  4 | Harley     | Gilbert   | hgi@gmail.com  |    6 | 2025-07-25 |  66.66 |           4 |
-- |  5 | haha       | lin       | haha@gmail.com | NULL | NULL       |   NULL |        NULL |
-- +----+------------+-----------+----------------+------+------------+--------+-------------+

select first_name,last_name,
case
    when SUM(amount) is NULL then 0
    else SUM(amount)
end as total_amount
from customers left join orders on customers.id = orders.customer_id group by customers.id;

select first_name,last_name, IFNULL(SUM(amount),0)
from customers left join orders on customers.id = orders.customer_id group by customers.id;


-- +------------+-----------+--------------+
-- | first_name | last_name | total_amount |
-- +------------+-----------+--------------+
-- | Robin      | Jackman   |       111.31 |
-- | Taylor     | Edward    |       110.99 |
-- | Vivian     | Dickens   |        88.09 |
-- | Harley     | Gilbert   |       271.67 |
-- | haha       | lin       |            0 |
-- +------------+-----------+--------------+


-- delete customers
delete from customers where id = 1;
select * from orders;
-- +----+------------+--------+-------------+
-- | id | order_date | amount | customer_id |
-- +----+------------+--------+-------------+
-- |  2 | 2001-09-21 | 110.99 |           2 |
-- |  4 | 2001-11-29 |  88.09 |           3 |
-- |  5 | 2001-11-11 | 205.01 |           4 |
-- |  6 | 2025-07-25 |  66.66 |           4 |
-- +----+------------+--------+-------------+

-- Questions & Answers
select first_name,last_name, count(*) as total ,ROUND(AVG(imdb_score),1) as imdv_avg 
from directors inner join movies where movies.director_id = directors.id 
group by directors.id;
-- +-------------+-----------+-------+----------+
-- | first_name  | last_name | total | imdv_avg |
-- +-------------+-----------+-------+----------+
-- | Christopher | Nolan     |     4 |      8.7 |
-- | Anthony     | Russo     |     1 |      8.2 |
-- | Doug        | Liman     |     1 |      7.9 |
-- | Andrew      | Stanton   |     1 |      8.4 |
-- | Dean        | DeBlois   |     1 |      8.2 |
-- | Pete        | Docter    |     2 |      8.3 |
-- | James       | Gunn      |     1 |      8.1 |
-- | Peter       | Jackson   |     2 |      7.9 |
-- | Bryan       | Singer    |     1 |        8 |
-- | Lee         | Unkrich   |     1 |      8.3 |
-- | Don         | Hall      |     1 |      7.9 |
-- | Joss        | Whedon    |     1 |      8.1 |
-- | Jon         | Favreau   |     1 |      7.9 |
-- | James       | Cameron   |     1 |      7.9 |
-- | Nathan      | Greno     |     1 |      7.8 |
+-------------+-----------+-------+----------+
