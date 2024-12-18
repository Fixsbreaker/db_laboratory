CREATE DATABASE lab5;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    cust_name VARCHAR(250),
    city VARCHAR(250),
    grade INTEGER,
    salesman_id INTEGER
);

INSERT INTO customers VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
                             (3005, 'Graham Zusi', 'California', 200, 5002),
                             (3001, 'Brad Guzan', 'London', null, 5005),
                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
                             (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                             (3008, 'Julian Green', 'London', 300, 5002);
CREATE TABLE orders (
    ord_no INTEGER PRIMARY KEY,
    purch_amt DOUBLE PRECISION,
    ord_date DATE,
    customer_id INTEGER REFERENCES customers (customer_id),
    salesman_id INTEGER
);

INSERT INTO orders VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
                         (70009, 270.65, '2012-09-10', 3001, 5005),
                         (70004, 110.5, '2012-08-17', 3009, 5003),
                         (70007, 948.5, '2012-09-10', 3005, 5002),
                         (70005, 2400.6, '2012-07-27', 3007, 5001),
                         (70008, 5760, '2012-09-10', 3002, 5001);

-- 3
SELECT SUM(purch_amt)
FROM orders;

-- 4
SELECT AVG(purch_amt)
FROM orders;

-- 5
SELECT COUNT(*) AS customer_count
FROM customers
WHERE cust_name IS NOT NULL;

-- 6
SELECT MIN(purch_amt)
FROM orders;

-- 7
SELECT *
FROM customers
WHERE cust_name LIKE '%b';

-- 8
SELECT *
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE city = 'New York'
);

-- 9
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE purch_amt > 10
);

-- 10
SELECT SUM(grade)
FROM customers;

-- 11
SELECT *
FROM customers
WHERE cust_name IS NOT NULL;

-- 12
SELECT MAX(grade)
FROM customers;