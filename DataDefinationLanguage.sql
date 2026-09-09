/* Create table in sql
syntax :  CREATE TABLE table_name(
	coloumn_name data_type constraints
)

NOT NULL : Prevents a column from accepting NULL (empty) values. 
Forces a value to be recorded.
name VARCHAR(50) NOT NULL

UNIQUE : Guarantees that all values in a column are distinct across the table.
Allows NULLs depending on the database engine.
email VARCHAR(255) UNIQUE

PRIMARY KEY : A combination of NOT NULL and UNIQUE. Uniquely identifies each row in a table. 
Only one primary key is allowed per table.
employee_id INT PRIMARY KEY

FOREIGN KEY : Links a column to a primary key in another table. 
Enforces referential integrity by ensuring cross-table data is valid.
customer_id INT REFERENCES Customers(id)

CHECKE : valuates a boolean condition before allowing data to be saved.
salary DECIMAL(10,2) CHECK (salary > 0)

DEFAULT : Provides a fallback value if no value is explicitly provided during insertion.
department_id INT DEFAULT 1 */


/*
CREATE TABLE person(
	id INT NOT NULL,
	name VARCHAR(70) NOT NULL,
	fav_food VARCHAR(50),
	CONSTRAINT pk_persons PRIMARY KEY(id)
)
SELECT* FROM person
*/

/* to MAKE AND EDIT IN COLUMN LIKE ADD COLOUMN OR DELETE COLOUMN in table we use ALTER command
When you add coloumn through ALTER command it by default is added to last of table
if you want to add it somewhere else you have to delete other coloumns
syntax: 
ALTER TABLE table_name
ADD column_name data_type constraints
*/

-- ADD TWO COLOUMNS NAMED email and birth date
ALTER TABLE person
ADD email varchar(50) NOT NULL, birth_date DATE
SELECT* FROM person

-- delete fav_food coloumn
ALTER TABLE person
DROP COLUMN fav_food
SELECT* FROM person

-- DELETE ENTIERE TABLE FROM DATABASE

DROP TABLE person