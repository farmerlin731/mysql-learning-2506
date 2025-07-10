use demo_ch08_0709;
-- numeric int type
-- tiny(1 byte) -> small(2) -> midium(3) -> int(4) ->big(8)
-- int example
DROP TABLE int_type;
CREATE TABLE int_type(
    a TINYINT unsigned,
    b SMALLINT,
    c MEDIUMINT,
    d INT,
    e BIGINT
);
INSERT INTO int_type(a) VALUES(255);


-- decimal example
DROP TABLE employee_decimal;
CREATE TABLE employee_decimal(
    salary DECIMAL(5,2)
);
INSERT INTO employee_decimal(salary) VALUES(567.89);
INSERT INTO employee_decimal(salary) VALUES(123);
INSERT INTO employee_decimal(salary) VALUES(234.567);

-- floating example
DROP TABLE example_float;
CREATE TABLE example_float(
    a_float FLOAT(10,2),
    b_double DOUBLE
);
INSERT INTO example_float(a_float) VALUES(131072.32);

-- bit example
DROP TABLE example_bit;
CREATE TABLE example_bit(
    a_bit BIT(8)
);
INSERT INTO example_bit(a_bit) VALUES(255);
SELECT a_bit,a_bit+0,bin(a_bit),oct(a_bit), hex(a_bit) from example_bit;


-- Answer for testing

DROP TABLE population;

CREATE TABLE population(
    id SMALLINT AUTO_INCREMENT PRIMARY key,
    country VARCHAR(50),
    population INT,
    date DATE,
    persent DECIMAL(5,2)
);

INSERT INTO population(country,population,date,persent) VALUES("China",1394930000,'2018-11-01',18.2);
INSERT INTO population(country,population,date,persent) VALUES("India",1338990000,'2018-11-01',17.5);
INSERT INTO population(country,population,date,persent) VALUES("Unite State",328099000,'2018-11-01',4.28);
desc population;

select id,country,population,date,CONCAT(persent,"%") as persent from population;

+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | smallint     | NO   | PRI | NULL    | auto_increment |
| country    | varchar(50)  | YES  |     | NULL    |                |
| population | int          | YES  |     | NULL    |                |
| date       | date         | YES  |     | NULL    |                |
| persent    | decimal(5,2) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

+----+-------------+------------+------------+---------+
| id | country     | population | date       | persent |
+----+-------------+------------+------------+---------+
|  1 | China       | 1394930000 | 2018-11-01 | 18.20%  |
|  2 | India       | 1338990000 | 2018-11-01 | 17.50%  |
|  3 | Unite State |  328099000 | 2018-11-01 | 4.28%   |
+----+-------------+------------+------------+---------+
