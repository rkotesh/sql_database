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