USE MyDatabase
--No joins
SELECT*
FROM customers

SELECT*
FROM orders

/* join syntax:
SELECT*
FROM TABLE1_NAME
[TYPE OF JOIN] JOIN TABLE2_NAME
ON COMMAN ID */
--tablename.columnname is used just to make it easy to recognise which value comes from which table
SELECT
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers
INNER JOIN orders
ON id=customer_id

SELECT*
FROM customers
INNER JOIN orders
ON id=customer_id

--Left join
--show info of all customers who have ordered and didnt ordered
SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c  --priority table in front of from clause
LEFT JOIN orders AS o
ON c.id=o.customer_id

SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales			--same result as left but using right
FROM orders as o
RIGHT JOIN customers as c
ON c.id=o.customer_id

SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o	--priority table in front of join
ON o.customer_id=c.id

-- all customers along with their orders including orders not matching customers (using left join)
SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM orders as o
LEFT JOIN customers as c
ON o.customer_id=c.id

--full join: joins two tables even if there is no match

SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers as c
FULL JOIN orders as o
ON c.id=o.customer_id

SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM orders as o
FULL JOIN customers as c
ON c.id=o.customer_id

--LEFT ANTI JOIN: RETURN ALL ROWS WHICH ARE PRESENT IN LEFT TABLE BUT HAS NO MATCH IN RIGHT TABLE
-- MORE SPECIFICALLY VALUES PRESENT ONLY IN LEFT TABLE

--GET ALL CUSTOMERS WHO HASENT PLACED ORDER
-- BELOW IS EXAMPLE OF LEFT ANTI JOIN
SELECT* 
FROM customers
LEFT JOIN orders
ON orders.customer_id=customers.id
WHERE orders.customer_id IS NULL

--RIGHT ANTI JOIN: IT IS TOTALLY OPPOSITE OF LEFT ANTI JOIN
-- GET ORDERS WHO HAS NO CUSTOMERS
SELECT*
FROM customers as c
RIGHT JOIN orders as o
ON o.customer_id=c.id
WHERE c.id is NULL

--SAME RESULT WITH LEFT JOIN
SELECT* 
FROM orders as o
LEFT JOIN customers as c
ON o.customer_id=c.id
where c.id is null

--FULL ANTI JOIN:
--SELECT CUSTOMERS WITHOUT ORDERS OR ORDERS WITHOUT CUSTOMERS

SELECT*
FROM customers as c
FULL JOIN orders as o
ON  o.customer_id=c.id
WHERE o.customer_id IS NULL OR c.id IS NULL

--full anti join
SELECT*
FROM customers as c
LEFT JOIN orders as o
ON c.id=o.customer_id
WHERE o.customer_id is not null

SELECT*
FROM customers as c
FULL JOIN orders as o
ON  o.customer_id=c.id
WHERE o.customer_id IS NOT NULL AND c.id IS NOT NULL
-- below is not full anti join
SELECT*
FROM customers
INNER JOIN orders
ON id=customer_id

--cross join: it is used to generate all possible combinations(cartesian products) of both table
-- syntax: SELECT* FROM TABLE1 CROSS JOIN TABLE2

SELECT* 
FROM customers
CROSS JOIN orders


---- joining multiple tables
USE SalesDB
/* "Task: Using SalesDB, Retrieve a list of all orders, along with the
related customer, product, and employee details. For each order, display: 
Order ID, Customer's name, Product name, Sales, Price, Sales person's name*/
SELECT
	 o.OrderID,
	 o.Sales,
	 c.FirstName AS CUSTOMERS_FIRST_NAME,
	 c.LastName AS CUSTOMERS_LAST_NAME,
	 p.Product,
	 p.Price,
	 e.FirstName AS EMP_FIRST_NAME,
	 e.LastName AS EMP_LAST_NAME
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID=c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID=p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID=e.EmployeeID
SELECT* FROM Sales.Orders
SELECT* FROM Sales.Customers
SELECT* FROM Sales.Employees
SELECT* FROM Sales.OrdersArchive
SELECT* FROM Sales.Products