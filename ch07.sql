-- select * from employee;
-- select count(distinct title) from employee;

-- Example stupid implementation:
-- select count(*) from employee where title="Software engineer";

-- Briliant
-- select title,count(first_name) from employee group by title;

-- search max salary by title
-- select title,max(salary) from employee group by title;

-- Example of sum & avg
-- select title,sum(salary),avg(salary) from employee group by title;

-- filter plus group by
-- select title, count(*) from employee where title="Software engineer" group by title;
-- select title, count(*) from employee group by title having title="Software engineer";


-- Answer for testing
-- select count(*) from movie where director_name="Christopher Nolan";

-- select count(*) from movie where actor_1_name="Tom Hardy" or actor_2_name="Tom Hardy";

-- select count(distinct(director_name)) from movie;

-- Q4:
-- select director_name,count(title) from movie group by director_name order by count(title) desc limit 5;
-- +-------------------+--------------+
-- | director_name     | count(title) |
-- +-------------------+--------------+
-- | Peter Jackson     |            4 |
-- | Christopher Nolan |            4 |
-- | Bryan Singer      |            4 |
-- | Gore Verbinski    |            3 |
-- | Sam Raimi         |            3 |
-- +-------------------+--------------+

-- Q5:
select director_name,sum(gross),count(title) from movie group by director_name order by sum(gross) desc limit 5;
+-------------------+------------+--------------+
| director_name     | sum(gross) | count(title) |
+-------------------+------------+--------------+
| Christopher Nolan | 1462006993 |            4 |
| James Cameron     | 1419178149 |            2 |
| Joss Whedon       | 1082271146 |            2 |
| Peter Jackson     | 1034516213 |            4 |
| Michael Bay       |  999863605 |            3 |
+-------------------+------------+--------------+