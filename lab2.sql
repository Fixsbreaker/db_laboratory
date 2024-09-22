CREATE DATABASE lab2; -- 1

CREATE TABLE countries ( -- 2
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR,
    region_id INT,
    population INT
);

INSERT INTO countries (country_name, region_id, population) VALUES ('Japan', 1, 30000000); --3

INSERT INTO countries (country_name) VALUES ('Korea'); -- 4

INSERT INTO countries (region_id) VALUES (NULL); -- 5

INSERT INTO countries (country_name, region_id, population) VALUES -- 6
    ('Turkey', 5, 6000000),
    ('Italia', 4, 5000000),
    ('Russia', 6, 144000000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan'; -- 7

INSERT INTO countries (country_name, region_id, population) VALUES (DEFAULT, 3, 2000000); -- 8

INSERT INTO countries DEFAULT VALUES; -- 9

CREATE TABLE countries_new (LIKE countries INCLUDING ALL); -- 10

INSERT INTO countries_new SELECT * FROM countries; -- 11

UPDATE countries SET region_id = 1 WHERE region_id IS NULL; -- 12

UPDATE countries SET population = population * 1.1 RETURNING country_name, population AS new_population; -- 13

DELETE FROM countries WHERE population < 100000; -- 14

-- DELETE FROM countries RETURNING *;
-- DELETE FROM countries_new RETURNING *;

DELETE FROM countries_new -- 15
USING countries
WHERE countries_new.country_id = countries.country_id
RETURNING countries_new.*;

DELETE FROM countries -- 16
RETURNING *;
















