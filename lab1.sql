CREATE DATABASE "lab1";

\c lab1

CREATE TABLE users (
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users
ADD COLUMN isadmin INTEGER;

ALTER TABLE users
ALTER COLUMN isadmin TYPE BOOLEAN USING (isadmin = 1);

ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users
ADD PRIMARY KEY (id);

CREATE TABLE tasks (
    id SERIAL,
    name VARCHAR(50),
    user_id INTEGER
);

DROP TABLE tasks;

DROP DATABASE lab1;


