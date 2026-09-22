--Funcions 
--Row functions 
--1. Concat(): concatinate two or more strings 
-- show customers name and country in one column
USE MyDatabase
SELECT
 first_name,
 country,
 CONCAT(first_name,country) as name_country
FROM customers

--UPPER() : convet string in upper case 
--LOWER(): convert string in lower case
--convert customers first name to lower case and in upper case
SELECT 
 first_name,
 LOWER(first_name) as lowercase,
 UPPER(first_name) as uppercase
FROM customers

--trim(): trims leading and trainling spaces
--show first names who does not have spaces at end 
SELECT
first_name
FROM  customers
WHERE first_name = TRIM(first_name)

--Replace(value_on which function to be applied,value to be replaced, value by which to be replaced)
--we can remove value by not specifing any thing as third argu

SELECT
'123-456-789',
REPLACE('123-456-789','-','/') -- REPLACING 


SELECT
'123-456-789',
REPLACE('123-456-789','-','') -- REMOVING 

--LEN : gives length of string 
--LEFT : extracts given no of characters from left of string 
--RIGHT : extracts given no of characters from right of string
--syntax for both is same: LEFT(STRING, NO OF CHARS )
SELECT 
'Maria',
LEFT('Maria',2),
Right('Maria',2)

--SUBSTRING(STRING,STARTING POSITION, NO OF CHARS)
SELECT
'MARIA',
SUBSTRING('MARIA',2,2)

--NAME OF ALL CURSTOMERS WITHOUT FIRST CHARACTER
SELECT
first_name,
SUBSTRING(TRIM(first_name),2,LEN(TRIM(first_name)))
FROM customers

--Number functions
--ROUND FUNCTION: IT IS USED TO ROUND THE DECIMAL VALUES
-- SYNTAX: ROUNT(VALUE,NO OF DECIMAL VALUES)
SELECT 3.156,
ROUND(3.156,2),
ROUND(3.156,1)
--ABS: GIVE ABSOLUTE VALUE(POSTIVIE VALUE )
SELECT -1,
ABS(-1)

--DATE TIME FUNCTIONS
USE SalesDB
SELECT 
ProductID,
OrderDate,
ShipDate,
CreationTime
FROM Sales.Orders

SELECT
GETDATE()

SELECT
ProductID,
CreationTime,
DAY(CreationTime)  DAY,
MONTH(CreationTime)  MONTH,
YEAR(CreationTime) AS YEAR,
DATEPART(YEAR,CreationTime) AS Year,
DATEPART(DAY,CreationTime) AS  Day,
DATEPART(MONTH,CreationTime) month,
DATEPART(QUARTER,CreationTime) quarter,
DATEPART(WEEK,CreationTime) week,
DATEPART(WEEKDAY,CreationTime) WEEKDAY,
DATEPART(HOUR,CreationTime) HOUR,
DATEPART(MINUTE,CreationTime) MINUTE,
DATEPART(SECOND,CreationTime) second,
DATEPART(MILLISECOND,CreationTime) milisecond
FROM Sales.Orders