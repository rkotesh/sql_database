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











