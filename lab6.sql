--1
CREATE DATABASE lab6;
\c lab6

-- 2
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    Last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

-- 3
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM employees as e
INNER JOIN departments as d ON e.department_id = d.department_id;

SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM employees as e
INNER JOIN departments as d ON e.department_id = d.department_id
WHERE
    e.department_id IN (80, 40);

-- 5
SELECT
    e.first_name,
    e.last_name,
    d.department_name,
    l.city,
    l.state_province
FROM employees as e
INNER JOIN departments as d ON e.department_id = d.department_id
INNER JOIN locations as l ON d.location_id = l.location_id;

-- 6
SELECT
    d.department_id,
    d.department_name,
    d.budget,
    l.city,
    l.state_province
FROM
    departments as d
LEFT JOIN employees as e ON d.department_id = e.department_id
INNER JOIN locations as l ON d.location_id = l.location_id;

-- 7
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM
    employees AS e
LEFT JOIN departments as d ON e.department_id = d.department_id;

DROP TABLE IF EXISTS locations CASCADE;

DROP TABLE IF EXISTS departments CASCADE;

DROP TABLE IF EXISTS employees CASCADE;


INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
('123 Elm St', '10001', 'New York', 'NY'),
('456 Maple Ave', '20001', 'Washington', 'DC'),
('789 Oak Blvd', '94107', 'San Francisco', 'CA');

INSERT INTO departments (department_id, department_name, budget, location_id)
VALUES
(80, 'Research', 200000, 1),
(40, 'Development', 250000, 2),
(1, 'Engineering', 1000000, 1),
(2, 'Human Resources', 300000, 2),
(3, 'Marketing', 500000, 3);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
('Alice', 'Smith', 'alice.smith@example.com', '123-456-7890', 80000, 80),
('Bob', 'Johnson', 'bob.johnson@example.com', '234-567-8901', 60000, 40),
('Charlie', 'Williams', 'charlie.williams@example.com', '345-678-9012', 75000, 3),
('Diana', 'Brown', 'diana.brown@example.com', '456-789-0123', 85000, 1),
('Edward', 'Jones', 'edward.jones@example.com', '567-890-1234', 65000, 2);



