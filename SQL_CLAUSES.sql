USE MyDatabase
/*
The primary difference is scope: a query is the entire request you send to a database to fetch or change data, while a clause is just a single building block inside that request.
Think of a query as a complete sentence and a clause as a grammatical phrase within that sentence. You cannot run a clause by itself, but you combine multiple clauses together to create a valid query.
------------------------------
## ⚖️ Side-by-Side Comparison

| Feature | Query | Clause |
|---      |---|---|
| Definition | A complete, executable database statement. | A distinct, functional modifier within a statement. |
| Independence | Can stand alone. It is fully executable by the database engine. | Cannot stand alone. It must be attached to a larger statement. |
| Purpose | To perform a full action (e.g., retrieving, updating, or deleting data). | To direct, filter, sort, or organize the data for the action. |
| Example | SELECT name FROM employees WHERE salary > 50000; | WHERE salary > 50000 |

------------------------------
## 🧩 Visualizing the Anatomy
To see how they fit together, look at this single Query:

SELECT product_name, price   -- (SELECT Clause)FROM inventory               -- (FROM Clause)WHERE stock_count < 10       -- (WHERE Clause)ORDER BY price DESC;         -- (ORDER BY Clause)


* The Entire Block is the Query. It represents the ultimate goal: “Show me the names and prices of low-stock products, sorted from most expensive to cheapest.”
* Each Line is an individual Clause. Each line has a specific, isolated task—like defining the source table (FROM) or setting a filter constraint (WHERE).

Are you practicing writing your own SQL scripts, or are you preparing for a database exam or interview? Let me know so I can tailor the next examples for you.

*/

/*
SELECT* : SELECTS ALL COLUMNS(ENTIRE TABLE)
FROM : FROME WHICH TABLE DO WE HAVE TO SELCET COLUMNS
SYNTAX: FROM table_name*/

/*
SELECT*
FROM customers

SELECT* 
FROM orders
*/


/*
TO SELECT SPECIFIC COLOUMNS SYNTAX IS 
SELECT coloumn name */
/*
SELECT 
	first_name,
	country
FROM CUSTOMERS
*/

-- There output of query will follow sequence as we write in select clause, it doesnot follow tables convention if you write country first then country wll be shown first
/*
SELECT 
	country,
	first_name
FROM customers
*/
/*
WHERE CLAUSE IS USED TO FILTER DATA AS PER CONDITION
while filtering rows which does not satisfy condition are eliminated 
SYNTAX: WHERE CONDITION 
IN SQL FOR EQUALITY CHECK WE USE SINGLE EQUAL TO SIGN EX A=B
*/
/*
SELECT*
FROM customers
WHERE score!=0
*/


-- select customers from Germany 
/*
SELECT 
	first_name,
	country,
	score
FROM customers
WHERE country='Germany'
*/


/* to write multiple conditions we can use and, or and in .The IN Operator 
(Shorthand for multiple ORs)If you are checking a single column against 
a list of multiple values, 
use IN to keep your code clean.
it works as same as diff programming language*/
/*
SELECT* 
FROM customers
WHERE country ='Germany' or score>500
*/
/*
WHERE country = 'Germany' and score=500 -- you cannot write more than one WHERE clauses in single query. it will throw error, only time it is possible is in subquery
*/

/* 
ORDER BY clause is used to sort data in ascending or descending order, 
it sort the table on basis or given coloumn and order
syntax: ORDER BY coloumn name ASC(FOR ASCENDING ORDER) or DESC(FOR DESCENDING ORDER)
IF YOU DONT SPECIFY ASC OR DESC SQL WILL ASSUME ITS ASCENING ORDER AND SORT IN ASCENDING ORDER
*/

/*
SELECT 
	country,
	score
FROM customers
ORDER BY score
*/
/*
SELECT 
	country,
	score
FROM customers
ORDER BY score DESC

SELECT 
	country,
	score
FROM customers
ORDER BY country
*/

-- here problem is Germany and USA has two scores and they are not sorted in order , to solve this we can sort score column also
--SO FIRST ROWS WILL BE SORTED IN ALPHABETICAL ORDER AS PER COUNTRY, THEN COUNTRY WHICH ARE REPEATING WILL BE SORED IN THEMSELVS ON BASIS OF SCORE
/*
SELECT 
	country,
	score
FROM customers

ORDER BY country,score DESC
*/
/*
📑 The Standard Writing Order
SELECT — Choose your columns or calculations.
FROM / JOIN — Specify the target table(s).
WHERE — Filter the raw data rows.
GROUP BY — Group the filtered rows together.
HAVING — Filter the grouped summaries.
ORDER BY — Sort the final results.
LIMIT / TOP — Restrict how many rows are display

If you change this order while writting query then engine will throw an error you must follow
this order strictly*/
/*
SELECT 
	country,
	score
FROM customers
WHERE score>=500
ORDER BY country,score DESC

*/

/*
The GROUP BY clause is used in SQL to arrange identical data into groups.
It gathers raw data rows that share the same values in specified columns and
collapses them into summary rows.
You almost always use GROUP BY alongside
aggregate functions (like COUNT(), SUM(), AVG(), MIN(), or MAX()) to 
calculate statistics about each group.*/
/*
SELECT
	country,
	SUM(score)
FROM customers
GROUP BY country
*/


/* in Group by coloumn names must be either in aggrigate function of group by clause, other wise it will throw error
it will not throw error if you didnt write coloumn name in select but write in group by but 
vice versa is not true*/
/*
SELECT
	country AS Nations,
	first_name,
	SUM(score) AS total_scores
FROM customers
GROUP BY country,first_name
*/

/* in new coloumn created by total score by country, coloumn dosent have any name, to give lable 
we use AS(ALIAS) : shorthand name/lable given to coloumn, you can rename any coloumn.
*/

/* find total score of each country and total customers by eacg country*/
/*

SELECT 
	country,
	SUM(score) AS total_score,
	COUNT(id) AS total_customers
FROM customers
GROUP BY  country

*/

/*
You cannot use WHERE in place of HAVING because WHERE only filters individual,
raw data rows before they are grouped, while HAVING filters aggregated summary 
rows after the groups are created.Because of this timeline difference, 
the database engine forbids you from using aggregate functions
(like SUM(), COUNT(), AVG()) inside a WHERE clause.*/
/*
SELECT 
	country,
	SUM(score) AS total_score,
	COUNT(id) AS total_customers
FROM customers
GROUP BY  country
HAVING SUM(score)>800
*/
/* Find the average score for each country considering only
customers with a score not equal to 0 And return only those countries with 
an average score greater than 430*/
/*
SELECT 
	country,
	AVG(score) AS avg_score
FROM customers
WHERE score!=0
GROUP BY country
HAVING AVG(score) >430 */

/* Distinct: it removes duplicates. dont use if its not necessary it is expensive operation*/
--select from which countries customers are

/*
SELECT DISTINCT country
FROM customers  */
--below is bad practice as id will be always unique and not necessary to write distinct
/*
SELECT DISTINCT id
FROM  customers

*/
--Top; selects top rows by row number. syntax : TOP no_of_rows
/*
SELECT TOP 3*
FROM customers
*/
--You can use order by only once in a query and that is at end of query
--select top three customers with highest score
/*
SELECT TOP 3*
FROM customers
ORDER BY score DESC
*/
--RETRIEVE LOWEST TWO CUSTOMERS BASED ON SCORE
/*
SELECT TOP 2*
FROM customers
ORDER BY score ASC
*/
-- GET MOST RECENT 2 ORDERS
SELECT TOP 2*
FROM  orders
ORDER BY order_date DESC


/*  SQL coding order      |  EXECUTING ORDER

1. SELECT DISTINCT TOP      1. FROM
2. FROM						2. WHERE
3. WHERE					3. GROUP BY
4. GROUP BY					4. HAVING
5. HAVING					5. SELECT DISTINCT
6. ORDER BY					6. ORDER BY
							7. TOP

							*/