-- To create database:
CREATE DATABASE chitter;
-- To create peeps table with id and content columns:
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(60));
ALTER TABLE peeps ADD time VARCHAR(60);

-- To create the test database, follow the above steps exactly but name
-- the database "chitter_test"
