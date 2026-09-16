--set operations 

SELECT
	FirstName,
	LastName
FROM Sales.Customers
UNION
SELECT
	FirstName,
	LastName
FROM Sales.Employees