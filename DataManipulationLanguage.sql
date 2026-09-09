/*
INSERT : insert is used to add values to table that is to add rows to table
SYNTAX: INSERT INTO table_name (coloumn_name1,coloumns_name2,coloumn_name3,...)
	VALUES (value1,value2,value3,...),
		(value1,value2,value3,...) // this is to add multiple rows at same time
RUle: number of coloumns must be equal to number of values
	if you dont specify coloumns then it is assumed that values are for all coloumns
	*/
-- ORDER OF COLOUMNS AND VALUES MUST BE SAME
-- 
/*

CREATE TABLE person(
	id INT NOT NULL,
	name VARCHAR(70) NOT NULL,
	birth_date DATE NULL,
	phone VARCHAR(12) NULL,
	CONSTRAINT pk_persons PRIMARY KEY(id)
)
*/

/*
INSERT INTO person (id,name,birth_date,phone)
VALUES (1,'SANKALP','2007-01-22','1244116'),
		(2,'SAKSHI','2004-06-02','7972473641')*/
/*
SELECT* FROM person
--You can skip coloumn names if you are going to insert values in every column
INSERT INTO person 
VALUES (4,'Tanaji','1976-06-01','9850338734')
SELECT* FROM person		

-- Coloumns not included in INSERT become null(unless default or constraint exist), you cant skip not null columns
INSERT INTO person (id,name)
VALUES (3,'Sunita','1980-11-11','9689414034'),
SELECT* FROM person		
*/
--Add data from one table(source table) to another table(target table).
/*
INSERT INTO person
SELECT 
	id,
	first_name,
	NULL
FROM customers
SELECT* 
FROM person */

/*

/*
INSERT INTO customers (id, first_name)
SELECT id+5, name
FROM person s

SELECT* 
FROM customers
*/
 Update: Update is used to update values in table
 Insert add new rows, update changes those values
 Syntax:
	UPDATE table_name
	SET column1=value1,
		column2=value2....
	WHERE CONDITION
IMP :     ALWAYS USE WHERE CONDITION TO AVOID UPDATING ALL ROWS UNINTENTIONALLY
IF YOU DONT USE WHERE ALL VALUES WILL BE UPDATED IN THOSE COLUMNS 
*/

/*
UPDATE customers
SET score=0
WHERE id>5
--without Where all scores will be set to 0
SELECT *
FROM customers
WHERE id>5
-- Best Practice : check with select that you have selected correct data before using update to avoide wrong update

*/

/*
--set score of customer having id 10 to 100 and country to india
UPDATE customers
SET score=100,
	country='INDIA'
WHERE id=10

SELECT*
FROM customers
WHERE id=10

*/
/*
--set score equal to null of customers having score equal to 0
UPDATE customers
SET score=NULL
WHERE score=0

SELECT*
FROM customers
WHERE score=0;

SELECT*
FROM customers

*/

/*
--set score of customers having null equal to 0

UPDATE customers
SET score=0
WHERE score IS NULL

SELECT*
FROM customers
WHERE score is null

SELECT*
FROM customers
*/

/*
Delete: used to delete entire row
changes done using delete can undone using rollback
SYNTAX:
	DELETE FROM table_name
	WHERE CONDITION
IMP:  do not forget do add where condition else entire table can be deleted
*/

DELETE FROM customers
WHERE id=5

SELECT*
FROM customers
WHERE id=5

SELECT*
FROM customers

/* Deleting all data from table two ways 1. use delete from tablename
										 2. use TRUNCATE TABLE tablename
Truncate is very fast and used for large table */

--DELETE DATA FROM PERSONS
TRUNCATE TABLE person
SELECT* 
FROM person