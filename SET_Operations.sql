--set operations 
USE SalesDB
SELECT
	FirstName,
	LastName
FROM Sales.Customers
UNION
SELECT
	FirstName,
	LastName
FROM Sales.Employees
--Union removes all duplicates and join tables by rows 
--Order of queries does not matter in union, but coloumn name will be that of coloumn name of first query
--NUmber of columns in query must be same
--Datatype of each corresponding columns must be same 
--order of column in each query must be same
--Union all works same as union but doesnot remove duplicates
--When to use? => when you are confident that there are no duplicates and if you want to find out if there are any duplicates
-- why to use=> it is faster than Union as it does not remove Union all

SELECT
	FirstName,
	LastName
FROM Sales.Customers
UNION ALL
SELECT
	FirstName,
	LastName
FROM Sales.Employees

--Except: it gives rows which are present in first table but not in second table
--it is used to find delta between two tables, check if table migration is sucessful
--FIND EMPLOYEES WHO ARE NOT CUSTOMERS
SELECT
	FirstName,
	LastName
FROM Sales.Employees
EXCEPT
SELECT
	FirstName,
	LastName
FROM Sales.Customers
--ORDER OF QUERY MATTER IN EXCEPT

--INTERSECT: GIVE VALUES WHICH ARE ONLY PRESENT IN BOTH TABLES
SELECT
	FirstName,
	LastName
FROM Sales.Customers
INTERSECT
SELECT
	FirstName,
	LastName
FROM Sales.Employees

--INFORMATION IS STORED IN TWO TABLES ORDERS AND ORDER ARCHIVE 
-- COMBINE THE ALL INFORMATION WITHOUT DUPLICATES
SELECT*
FROM Sales.Orders
UNION
SELECT* 
FROM Sales.OrdersArchive

-- ABOVE QUERY DOES THE WORK BUT ITS BAD PRACTICE BECAUSE SOME TIMES ORDER OR COLUMNS MIGHT BE DIFFERENT WHICH CAN THROW ERROR
SELECT 'ORDERS' AS SOURCETABLE,
[OrderID],
[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 'ORDERSARCHIVBE' AS SOURCETABLE,
[OrderID],
[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID