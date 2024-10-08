-- 1
CREATE DATABASE lab4;

-- 2
CREATE TABLE Warehouses (
    warehouse_id SERIAL PRIMARY KEY,
    location VARCHAR(100),
    capacity INT
);

CREATE TABLE Boxes (
    box_id SERIAL PRIMARY KEY,
    contents VARCHAR(100),
    value DECIMAL(10, 2),
    warehouse_id INT REFERENCES Warehouses(warehouse_id)
);

-- 3
INSERT INTO Warehouses (location, capacity)
VALUES
    ('Chicago', 3),
    ('Los Angeles', 8),
    ('San Francisco', 7),
    ('New York', 3);

INSERT INTO Boxes (contents, value, warehouse_id)
VALUES
    ('Clothes', 100, 1),
    ('Books', 200, 2),
    ('Shoes', 250, 3),
    ('Papers', 200, 2),
    ('Electronics', 300, 4);

-- 4
SELECT * FROM Warehouses;

-- 5
SELECT * FROM Boxes WHERE value > 150;

-- 6
SELECT DISTINCT contents FROM Boxes;

-- 7
SELECT warehouse_id, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse_id;

-- 8
SELECT warehouse_id, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse_id
HAVING COUNT(*) > 2;

-- 9
INSERT INTO Warehouses (location, capacity)
VALUES ('New York', 3);

-- 10
INSERT INTO Boxes (contents, value, warehouse_id)
VALUES ('Papers', 200, 2);

-- 11
UPDATE Boxes
SET value = value * 0.85
WHERE box_id = (
    SELECT box_id
    FROM Boxes
    ORDER BY value DESC
    OFFSET 2 LIMIT 1
);

-- 12
DELETE FROM Boxes
WHERE value < 150;

-- 13
DELETE FROM Boxes
USING Warehouses
WHERE Boxes.warehouse_id = Warehouses.warehouse_id
AND Warehouses.location = 'New York'
RETURNING *;