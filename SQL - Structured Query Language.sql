SQL - Structured Query Language

things can be done by sql 
- inserting data
- retrieving data
- modifying data
- delete data
- manage data

DBMS - Database Management System

a software which is used to manage, manipulate and create the database 
ex: 
- Oracle r-dbms
- MySQL
- db2
- sql server
- mongodb

MySQL
 is an open source database product that uses sql to organize the data.
the raw facts which describes the attributes(properties) of an entity(object) 
data can be valid or invalid based on the situation 

ex: 
College - database name

student(entity)
id - attributes
name - attributes
age - attributes

Query Language :

is used to communicate with the database system software.
the dbms software may have any of the following model for storing the data:

1. hierarchical model - fetching data is easy
	it is the first model, developed by dbms developers,
it organizes the data in hierarchical tree like structure,
the tree starts from root then it expands in the tree form.

advantage:
- it is simple & fast to transfers to a tree like structures 
- any change in parent node is automatically reflected in the child node,
so the integrity of the data is maintain.

disadvantage:
- if a parent node is deleted the child node is automatically deleted or relationship will be destroyed.
- complex relationship are not supported.


ex:

	   shoe
	/	\
    women	   Men
    /   \       /       \
high   Normal	running  formal shoe
		shoe	
heels	shoe	

	
2. Network model
	this model is same as or an extension of hierarchical model, in this model all the nodes are connected to more parent nodes.
in simple - this model is same as the hierarchical model, the only difference is that a record can have more parent.
it replaces the hierarchical model, i.e tree structure with a graph.

advantage:
- data can be accessed faster than hierarchical model, is because of all the nodes are interconnected and their can be more than one path to reach a particular node.

disadvantage:
- a more and more relationship needed to be handled and the system might get complex, so the user must have detailed knowledge  of work of the model.

ex:

		College
	/	|	|	\
	CSE	EEE	ECE	CSM
	\	|	|	/
		Student


Relational Database

this model was developed by "ffcod", in this model data will be stored in terms of row & column
ex: table

RDBMS:

stands for relational database management system 
- a type of dbms system software which stores the data using relational mode is known as rdbms.

Table : is a logical structure which contains column row and cell.
Column : it represents the attributes of an entity.


SQL - Structured Query Language

IBM developed the relational model based on dbms which was known as system arc, then they developed a language to interact with system arc which is known as seql - structured English query language developed in 1970' by IBM researchers & their need was Raymon, boycs and Donald, Champlin.

Types of statements:

1. DDL - data definition language 
this language is used to define the table 
- create
  the statement is used to create the data in the database 
- rename 
  is used to change the name of the table(sometimes is used to change column name too)
- truncate
  is used to delete all the records and data from the table but the table structure remains same.
- drop
  is used to delete all the records and data from the table and database,
even the table structure or the database will be deleted or destroyed.



SQL Constraints:

are the rule applied to the column in a database to control the type of the data that can be stored and maintain data accuracy.

PRIMARY KEY:
- is a column or a combination of columns that uniquely identify each record in a table
- cannot contain null
- cannot contain duplicate value
- a table can have only one primary key 
- it can contains one or more columns 
ex: 

CREATE TABLE students (
	student-id INT PRIMARY KEY,
	name VARCHAR(100),
	age INT
);


FOREIGN KEY:

is a column that create a relationship between two tables it usually refers to primary key of another table.
ex:

CREATE TABLE departments (
 department_id INT PRIMARY key,
 department_name VARCHAR(100)
);

CREATE TABLE students (
 student_id INT PRIMARY KEY,
 name VARCHAR(100),
 department_id INT.
 
 FOREIGN KEY (department_id)
 REFERENCES departments(department_id)
);


NOT NULL:

ensures that the column must have a value. It prevents the column from containing a null value.
ex:
CREATE DATABASE CIET
use CIET
CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 salary DECIMAL(10, 2)
);

INSERT INTO employees 
VALUES (101, "ram", 50000);
INSERT INTO employees
VALUES (102, NULL, 345000);


UNIQUE:

ensures that the duplicate values are not allowed in the column.
ex:

CREATE TABLE users (
 user_id INT PRIMARY KEY,
 name VARCHAR(100) UNIQUE,
 email VARCHAR(100) UNIQUE
);

INSERT INTO users
VALUES (1, 'ram', ram@gmail.com);

INSERT INTO users
VALUES (2, 'ramkotesh', rkotesh@gmail.com);

INSERT INTO users
VALUES (3, 'nari', nari@gmail.com);

INSERT INTO users
VALUES (2, 'ramkotesh', rkotesh@gmail.com);




Difference Between PRIMARY KEY AND UNIQUE:

PRIMARY KEY: 
- a primary key unify a identifier in a row 
- cannot contain null 
- one primary key per table 

UNIQUE: 
- prevent duplicate values 
- null handling depends on dbms 
- multiple unique constraints possible 



Default:

it automatically provides a value when the user does not provide a value during insertion.
ex:

CREATE TABLE employees(
 employee_id INT PRIMARY KEY,
 name VARCHAR(100),
 city VARCHAR(50) DEFAULT 'Banglore'
);
INSERT INTO employees(employee_id, name)
VALUES(10, 'Ram');


Check:
ensures that the value inserted into the column satisfy a specific condition.

ex:

CREATE TABLE students(
 name VARCHAR(100),
 age INT CHECK(AGE >= 18)
);
INSERT INTO students
VALUES (101, 'Ram', 20);
INSERT INTO students
VALUES (102, 'Narendra', 15);



SQL DATATYPES

datatypes in sql defines what kind of value can be stored in a column of a table 

1. int - stores the whole numbers without decimal numbers 

Datatype	Storage	Signed Range
TINY INT	1 byte	-128 - 127
SMALL INT 	2 bytes	-32769 - 32767
MEDIUM INT 	3 bytes	-8388608 -8388607
INT 		4 bytes	-2147483648 - 2147483647
BIGINT		8 bytes	-922337203684775808 - 9223372036854775807


2. CHAR

is used to store a fixed length string.
ex:
CREATE TABLE users(
 gender CHAR(1),
 country_code CHAR(2)
);

INSERT INTO users
VALUES ('M', 'IN');


Q: 
create a sql database for an org that stores dept and emp info. the database must demonstrate the sql constraints 
- primary key
- foreign key
- not null
- unique
- default
- check
create two tables 
- departments -> should contain emp_id, emp_name, email, salary, city, dept_id
apply the appropriate constraints and insert the valid department record.
- employees



DESCRIPTION - desc 

USE company_db;

CREATE TABLE departments (
	dept_id INT PRIMARY KEY,
	dept_name varchar(100) UNIQUE NOT NULL,
	emp_id INT PRIMARY KEY,
	emp_name varchar(100) UNIQUE NOT NULL,
	email varchar(100) UNIQUE,
	salary INT,
	city varchar(100)
);

INSERT INTO departments
VALUES (1, 'Computer Science');
INSERT INTO departments
VALUES (2, 'Civil');
INSERT INTO departments
VALUES (3, 'Mechanical');

create TABLE employees (
    emp_id int primary key,
    name varchar(100) not null,
    email varchar(100) unique,
    salary decimal(10, 2) check(salary > 0),
    city varchar(50) default 'Bangalore',
    dept_id int,
    
    foreign key(dept_id)
    references departments(dept_id)
);


show tables;
desc departments;
desc employees;



Q: 
a college want to maintain info about it's course and students.
create a database name college_db,
and create the following tables 

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    duration INT CHECK (duration > 0),
    fees DECIMAL(10, 2) CHECK (fees > 0)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Bangalore',
    course_id INT,
    
    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);



ALTER table

is used to modify an existing table structure you can
add a column, modify a column, rename a column, drop a column, and add constraints
- add column
 synax: ALTER TABLE table_name
	ADD column_name datatype

- modifying the column
 syntax: ALTER TABLE table_name
	modify column_name datatype

- rename the column
syntax: ALTER TABLE table_name
	rename column column_name to column_name

- drop column 
syntax: ALTER TABLE table_name
	drop column column_name


Joints

a join in sql is used to combine rows, from two or more tables based on a related column between them.
syntax:
SELECT column_list 
FROM table1 
JOIN table2 
ON table1.column_name = table2.column_name;

1. Inner Join 
	returns only the record that have matching values in both the tables

2. Left Join
	returns all the records from the left table, matching record from the right table and it returns null, if there is no match found.
Write a query to compare dept_id from employee matching with the table depts.

3. self join
	a self join joins the table with itself.

4. cross join
	produces every possible combination of rows 

5. multiple joins
	using two or more join operations in a single sql query to retrieve data from multiple tables.
6. join - where
	is used when we want to combine data from two or more tables using a join and then filter the results rows using the where condition.


Q:
Write a query to display employees and their departments the hr department want to know which department each employee belongs to display employee name and department name. 

-- SELECT 
--     e.employee_name, 
--     d.department_name
-- FROM 
--     employees e
-- INNER JOIN 
--     departments d ON e.department_id = d.department_id;

Q:
Write a query to display employee, salary and dept. management wants a report showing each employees salary along with thier dept.

select 
	e.employee_name,
    e.salary,
    d.department_name
from 
	employees e
JOIN departments d
ON e.department_id = d.department_id;

Q: 
find the employees walking in IT, the it dept wants list of all employees working in it.

SELECT 
	e.employee_name, 
    d.department_name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

Q:
to display employees and then projects, the project manager wants to know which employee is assigned to which project on what date.
SELECT 
    e.employee_name,
    p.project_name, 
    ep.assigned_date
FROM employees e
JOIN employee_projects ep
	ON e.employee_id = ep.employee_id
JOIN projects p 
	ON ep.project_id = p.project_id;

Q:
find the employees working on the e-commerce application, management wants to know which employees are working on the e commerce application.
SELECT 
    e.employee_name,
    p.project_name
FROM employees e
JOIN employee_projects ep 
	ON e.employee_id = ep.employee_id
JOIN projects p
	ON ep.project_id = p.project_id
WHERE p.project_name = 'E-Commerce Application';


Q:
find the employee working on banking application, the banking project manager want to see all the employees assigned to the banking application and the assigned date.

SELECT 
    e.employee_name,
    p.project_name,
    ep.assigned_date
FROM employees e
JOIN employee_projects ep 
	ON e.employee_id = ep.employee_id
JOIN projects p 
	ON ep.project_id = p.project_id
WHERE p.project_name = 'Banking Application';


Views:
	is a virtual table created using sql query, it doesnot normally store the actual result.

View + where:
	

view + join:

Functions:

they are 2 imp types
1. built in
	- count()
	- sub()
	- average()
	- math()
	- upper()
	- lower()
	- max()
	- min()
	- round()

2. user-defined -> using create() 

String functions
	- upper()
	
Aggregate functions:
	1. count()
	2. sum()
	3. average - avg()
	4. max()
	5. min()
	6. round()
Q:
a query and create a view for employee details, the hr team frequently needs emp_name, email, salary, dept_name. create a view so they  don't have to write the join query every time.

create view employee_details AS
select 
	e.employee_id,
    e.employee_name,
    e.email,
    e.salary,
    d.department_name
from employees e
join departments d
	on e.department_id = d.department_id;
select * from employee_details;


Q:
view for an it employees, the it dept frequently needs a list of its employees.

create view it_employees AS
select 
	e.employee_id,
    e.employee_name,
    e.email,
    e.salary,
    d.department_name
from employees e
join departments d
	on e.department_id = d.department_id;
select * from employee_details
where department_name = 'IT';


Q:
a query for view for higher salary employee management frequently want to see employees earning more than 60000.

create view highest_salary_employees AS
select 
	e.employee_id, 
	e.email,
	e.salary,
	d.department_name
from employees e
join departments d
	on e.department_id = d.department_id
where e.salary > 60000;
select * from highest_salary_employees;


view + join & groupby :
	
Modifier View:

function in sql :- is a stored program that performs a specific operation and must be return a single value.
stored procedures :- is a set of sql statements stored inside the database that executes whenever require 
syntax: 
	DELIMITER //
	CREATE FUNCTION function_name(parameter datatype)
	RETURNS datatype
	DETERMINISTIC
	BEGIN
		-- STATEMENTS
	RETURN value;
	END //
	DELIMITER;


user-defined function :- is a resuable sql program that accepts input and returns one value.
	Q: create a function to calculate annual salary.
	-- delimiter
DELIMITER //

CREATE FUNCTION annual_salary(monthly_salary DECIMAL(10, 2))
RETURNS DECIMAL(12, 2)
DETERMINISTIC
BEGIN
	RETURN monthly_salary * 12;
END //

DELIMITER ;
select 
	employee_name,
    salary,
    annual_salary(salary) as yearly_salary
from employees;


function with if condition : 
	
simple store procedure : is a pre-combined collection of sql statements stored inside the database unlike a function a procedure doesnot have to return a single value it can insert, update, delete, select, accept parameters, in function.
	
procedure with in - parameter :- 
Q: find employees from a particular department.
DELIMITER //

CREATE PROCEDURE get_employees_by_departments(
    IN dept_id INT
)
BEGIN
    SELECT
        employee_id,
        employee_name,
        salary,
        department_id
    FROM employees
    WHERE department_id = dept_id;
END //

DELIMITER ;

CALL get_employees_by_departments(1);


Q:
Procedure to insert employee.

-- DELIMITER //

-- CREATE PROCEDURE add_employee(
-- 	in emp_name varchar(100),
-- 	in emp_email varchar(100),
--     in emp_salary decimal(10, 2),
--     in dept_id int,
--     in join_date date
-- )
-- begin
-- 	insert into employees
--     (
-- 		employee_name,
--         email,
--         salary,
--         department_id,
--         joining_date
-- 	)
--     values
--     (
--     emp_name,
--     emp_email,
--     emp_salary,
--     dept_id,
--     join_date
-- 	);
-- end //

-- delimiter ;
-- call add_employee(
-- 	'vijay',
--     'vijay@gmail.com',
--     65000,
--     1,
--     '2026-04-19'
-- );


Procedure to update salary.

DELIMITER //
CREATE PROCEDURE update_employee_salary(
	in emp_id int,
    in new_salary decimal(10, 2)
)
begin
	update employees
    set salary = new_salary
    where employee_id = emp_id;
END //
delimiter ;
call update_employee_salary(2, 700000);

select * from employees;	


Procedure to delete employee


-- procedure to delete employee
DELIMITER //

CREATE PROCEDURE delete_employee(
    IN emp_id INT
)
BEGIN
    DELETE FROM employees 
    WHERE employee_id = emp_id;
END //

DELIMITER ;


Stored procedure with if: find whether an employee earns a high salary 

jdbc architecture 
- java database connectivity -> allows java application to communicate with the database, and the basic flow.

Java project flow

java application
	|
jdbc api
	|
mysql jdbc driver
	|
mysql server
	|
database










