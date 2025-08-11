use demo_ch14_0804;

-- Question 1
select title,ROUND(AVG(rating),2) as avg_rating 
from books 
inner join reviews on books.id = reviews.book_id 
group by books.id 
order by avg_rating desc;
-- +---------------------------------------------------------------+------------+
-- | title                                                         | avg_rating |
-- +---------------------------------------------------------------+------------+
-- | Minna No Nihongo: Beginner 1, 2nd Edition                     |       9.90 |
-- | Collection Folio, no. 2                                       |       9.40 |
-- | The Fault in Our Stars                                        |       9.36 |
-- | Santo remedio: Ilustrado y a color                            |       8.60 |
-- | Fifty Shades of Grey Series                                   |       8.12 |
-- | Harry Potter Und der Stein der Weisen (German Edition)        |       8.12 |
-- | Civilian Publishing Alif Baa Taa: Learning My Arabic Alphabet |       8.08 |
-- | Santo Remedio                                                 |       7.94 |
-- | The Hunger Games (Book 3)                                     |       7.52 |
-- | Splatoon 2                                                    |       5.38 |
-- +---------------------------------------------------------------+------------+

-- Question 2
select first_name,last_name,ROUND(AVG(rating),2) as avg_rating 
from reviewers 
inner join reviews on reviewers.id = reviews.reviewer_id 
group by reviewers.id;
-- +------------+-----------+------------+
-- | first_name | last_name | avg_rating |
-- +------------+-----------+------------+
-- | Thomas     | Stoneman  |       8.02 |
-- | Wyatt      | Skaggs    |       7.71 |
-- | Kimbra     | Masters   |       7.86 |
-- | Domingo    | Cortes    |       7.78 |
-- | Colt       | Steele    |       8.77 |
-- | Pinkie     | Petit     |       7.25 |
-- +------------+-----------+------------+

-- Question 3
select first_name,last_name,ROUND(AVG(rating),2) as avg_rating 
from reviewers 
left join reviews on reviewers.id = reviews.reviewer_id 
group by reviewers.id;
-- +------------+-----------+------------+
-- | first_name | last_name | avg_rating |
-- +------------+-----------+------------+
-- | Thomas     | Stoneman  |       8.02 |
-- | Wyatt      | Skaggs    |       7.71 |
-- | Kimbra     | Masters   |       7.86 |
-- | Domingo    | Cortes    |       7.78 |
-- | Colt       | Steele    |       8.77 |
-- | Pinkie     | Petit     |       7.25 |
-- | Marlon     | Crafford  |       NULL |
-- +------------+-----------+------------+

-- Question 4
select 
    first_name,
    last_name,
    COUNT(rating) as COUNT,
    MIN(IFNULL(rating,0)) as MIN,
    MAX(IFNULL(rating,0)) as MAX,
    ROUND(IFNULL(AVG(rating),0),2) as AVG,
    -- CASE
    --     WHEN COUNT(rating) > 0 THEN 'ACTIVE'
    --     ELSE 'INACTIVE'
    -- END as STATUS
    IF(COUNT(rating) > 0 ,'ACTIVE','INACTIVE') as NEW_STATUS
from reviewers 
left join reviews on reviewers.id = reviews.reviewer_id 
group by reviewers.id
order by AVG desc;
-- +------------+-----------+-------+------+------+------+------------+
-- | first_name | last_name | COUNT | MIN  | MAX  | AVG  | NEW_STATUS |
-- +------------+-----------+-------+------+------+------+------------+
-- | Colt       | Steele    |    10 |  4.5 |  9.9 | 8.77 | ACTIVE     |
-- | Thomas     | Stoneman  |     5 |  7.0 |  9.5 | 8.02 | ACTIVE     |
-- | Kimbra     | Masters   |     7 |  6.8 |  9.0 | 7.86 | ACTIVE     |
-- | Domingo    | Cortes    |     8 |  5.8 |  9.1 | 7.78 | ACTIVE     |
-- | Wyatt      | Skaggs    |     8 |  5.5 |  9.3 | 7.71 | ACTIVE     |
-- | Pinkie     | Petit     |     4 |  4.3 |  8.8 | 7.25 | ACTIVE     |
-- | Marlon     | Crafford  |     0 |  0.0 |  0.0 | 0.00 | INACTIVE   |
-- +------------+-----------+-------+------+------+------+------------+