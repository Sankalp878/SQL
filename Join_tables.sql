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