SELECT* 
FROM customers
WHERE score BETWEEN 100 AND 500

SELECT*
FROM customers
WHERE country='Germany' AND score=500

SELECT*
FROM customers
WHERE country in ('INDIA','UK')


SELECT*
FROM customers
WHERE country not in ('INDIA','UK')

-- customers whose first name starts with m
SELECT*
FROM customers
WHERE first_name like 'M%'

-- customers whose first name ends with n
SELECT*
FROM customers
WHERE first_name like '%n'
-- customers whose first name contains letter r
SELECT*
FROM customers
WHERE first_name like '%r%'

-- customers whose first name has letter 'r' at third position
SELECT*
FROM customers
WHERE first_name like '__r%'