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
