CREATE DATABASE company_db; -- Creates a new database

SHOW DATABASES; -- Shows all databases

USE company_db; -- Selects the database to work with

CREATE TABLE departments ( -- Creates the departments table
    department_id INT PRIMARY KEY, -- Unique ID for each department
    department_name VARCHAR(100) UNIQUE NOT NULL -- Department name, no duplicates or NULL
);

DESC departments; -- Shows table structure

INSERT INTO departments
VALUES (1, 'Computer Science'); -- Adds a department

INSERT INTO departments
VALUES (2, 'Mechanical'); -- Adds a department

SELECT * FROM departments; -- Displays all departments


CREATE TABLE employees ( -- Creates the employees table
    employee_id INT PRIMARY KEY, -- Unique ID for each employee

    name VARCHAR(100) NOT NULL, -- Employee name is required

    email VARCHAR(100) UNIQUE, -- Email must be unique

    salary DECIMAL(10,2) CHECK (salary > 0), -- Salary must be greater than 0

    city VARCHAR(50) DEFAULT 'Bangalore', -- Default city is Bangalore

    department_id INT, -- Stores department ID

    FOREIGN KEY (department_id) -- Connects employee to a department
    REFERENCES departments(department_id) -- References department ID
);

INSERT INTO employees
(employee_id, name, email, salary, department_id)
VALUES
(101, 'Rahul', 'rahul@gmail.com', 50000, 1); -- Adds an employee




/*

Problem Statement

A college wants to maintain information about its courses and students.

Create a database named college_db and create the following tables:

courses
Column	Data Type	Constraint
course_id	INT	PRIMARY KEY
course_name	VARCHAR(100)	UNIQUE, NOT NULL
duration	INT	CHECK
fees	DECIMAL(10,2)	CHECK
students
Column	Data Type	Constraint
student_id	INT	PRIMARY KEY
student_name	VARCHAR(100)	NOT NULL
email	VARCHAR(100)	UNIQUE
age	INT	CHECK
city	VARCHAR(50)	DEFAULT
course_id	INT	FOREIGN KEY
Requirements
Create the database.
Create the courses table.
Insert at least 3 courses.
Create the students table.
Insert at least 5 students.
Demonstrate all six constraints:
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
DEFAULT
CHECK
Display all students.
Display students along with their course names.
Find students above a particular age.
Find students enrolled in a particular course.    */

-- Solution

CREATE database college_db;

use college_db;

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



INSERT INTO courses
VALUES
(1, 'Java Full Stack', 6, 25000),
(2, 'Python Full Stack', 5, 20000),
(3, 'Data Science', 8, 35000);

INSERT INTO courses
(course_id, course_name, fees)
values
(4, 'Python', 40000);

INSERT INTO students
VALUES
(101, 'Arjun', 'arjun@gmail.com', 21, 'Guntur', 1),
(102, 'Rahul', 'rahul@gmail.com', 22, 'Vijayawada', 2),
(103, 'Kiran', 'kiran@gmail.com', 20, DEFAULT, 3);

-- select * from courses;
-- select * from students;

-- alter
-- add

alter table students
add phone_num int(100);.
add address varchar(200);

select * from students;

-- modify

alter table students
modify age decimal(12, 2);
select * from students;
desc students;

-- rename

alter table students
rename column phone_num to phone_number;
desc students;

-- drop 

ALTER TABLE students
drop column phone_number;
desc students;


-- Joints
CREATE DATABASE organization1;

USE organization1;
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    department_id INT,
    manager_id INT,
    joining_date DATE,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
);
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    start_date DATE
);
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    assigned_date DATE,

    PRIMARY KEY (employee_id, project_id),

    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id),

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
);
INSERT INTO departments
(department_name, location)
VALUES
('IT', 'Bangalore'),
('HR', 'Hyderabad'),
('Finance', 'Mumbai'),
('Sales', 'Delhi');
INSERT INTO employees
(employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
('Rahul', 'rahul@gmail.com', 75000, 1, NULL, '2022-01-10'),
('Priya', 'priya@gmail.com', 65000, 1, 1, '2023-03-15'),
('Amit', 'amit@gmail.com', 55000, 2, NULL, '2021-07-20'),
('Sneha', 'sneha@gmail.com', 60000, 2, 3, '2024-02-12'),
('Arjun', 'arjun@gmail.com', 80000, 3, NULL, '2020-11-05'),
('Kiran', 'kiran@gmail.com', 50000, 4, NULL, '2023-08-18'),
('Neha', 'neha@gmail.com', 70000, 1, 1, '2024-01-25');
INSERT INTO projects
(project_name, budget, start_date)
VALUES
('E-Commerce Application', 500000, '2024-01-01'),
('Banking Application', 800000, '2024-03-01'),
('HR Management System', 300000, '2024-05-01');
INSERT INTO employee_projects
(employee_id, project_id, assigned_date)
VALUES
(1, 1, '2024-01-05'),
(2, 1, '2024-01-10'),
(7, 1, '2024-02-01'),
(1, 2, '2024-03-05'),
(5, 2, '2024-03-10'),
(3, 3, '2024-05-05'),
(4, 3, '2024-05-10');


-- inner join syntax
-- select columns
-- from table1
-- inner join table2
-- on table1.column = table2.column;

-- ex:
select 
	e.employee_name,
    d.department_name
    
from employees e
inner join departments d
on e.department_id = d.department_id;

-- left join

select 
	e.employee_name,
    d.department_name
from employees e
left join departments d
on e.department_id = d.department_id;


-- left join - self join
select 
	e.employee_name AS employee,
    m.employee_name AS manager
from employees e
left join employees m
on e.manager_id = m.employee_id;

-- cross join

select 
	e.employee_name,
    p.project_name
from employees e
cross join projects p;


-- multiple joins

-- select 
-- column1,
-- column2,
-- clumn3
-- from table1
-- join table2
-- on table1.column_column = table2.column_column

SELECT 
    e.employee_name, 
    d.department_name, 
    p.project_name 
FROM employees e 
INNER JOIN departments d 
    ON e.department_id = d.department_id 
INNER JOIN employee_projects ep 
    ON e.employee_id = ep.employee_id 
INNER JOIN projects p 
    ON ep.project_id = p.project_id;

    
-- join - where
select 
	e.employee_name,
	p.project_name,
	p.budget
from employees e
join employee_projects ep
	on e.employee_id = ep.employee_id
join projects p
on ep.project_id = p.project_id
where p.budget >400000

-- functions

select upper(employee_name)
from employees;

select lower(location)
from departments;

select 
    employee_name,
    length(employee_name) AS name_length
from employees;

-- count() 
select count(*) AS total_employees
from employees;

--sum()
select sum(salary) AS total_salary
from employees;

--avg()
select avg(salary) AS average_salary
from employees;

-- max()
select max(salary) AS highest_salary
from employees;

-- min()
select min(salary) AS lowest_salary
from employees;

--round()
select round(avg(salary), 2) AS average_salary
from employees;



view + join & groupby :

create view department_salary_summary as
select
	d.department_name,
    count(e.employee_id) as employee_count,
    avg(e.salary) as average_salary,
    max(e.salary) as highest_salary,
    min(e.salary) as lowest_salary
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_id, d.department_name;

select * from department_salary_summary;
