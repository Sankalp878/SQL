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
