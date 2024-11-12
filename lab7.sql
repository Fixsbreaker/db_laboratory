CREATE DATABASE lab7;

\c lab7

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT REFERENCES departments(id)
);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    budget DECIMAL(15, 2) NOT NULL
);

INSERT INTO countries (id, name)
VALUES
(1, 'Kazakhstan'),
(2, 'USA'),
(3, 'Germany'),
(4, 'Japan'),
(5, 'France');

INSERT INTO employees (id, name, surname, salary, department_id)
VALUES
(1, 'Alice', 'Smith', 60000, 1),
(2, 'Bob', 'Johnson', 70000, 2),
(3, 'Carol', 'Williams', 80000, 3),
(4, 'David', 'Brown', 90000, 4),
(5, 'Eve', 'Jones', 100000, 1);

INSERT INTO departments (id, name, budget)
VALUES
(1, 'HR', 500000),
(2, 'IT', 1000000),
(3, 'Finance', 750000),
(4, 'Marketing', 600000),
(5, 'Sales', 900000);

-- 1
CREATE INDEX idx_countries_name ON countries (name);

-- 2
CREATE INDEX idx_employees_name_surname ON employees (name, surname);

-- 3
CREATE UNIQUE INDEX idx_employees_salary_range ON employees (salary);

-- 4
CREATE INDEX idx_employees_name_prefix ON employees ((substring(name FROM 1 FOR 4)));

-- 5
CREATE INDEX idx_employees_departments_budget_salary ON employees (department_id, salary);
CREATE INDEX idx_departments_budget ON departments (budget);
