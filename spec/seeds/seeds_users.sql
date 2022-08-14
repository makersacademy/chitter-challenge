-- -- DROP TABLE IF EXISTS users; 

-- -- Table Definition
-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   name text,
--   username text,
--   email text,
--   password text
-- );

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES
('John Isaac', 'JI2022', 'john@hotmail.com', 'password123'),
('Daniel Roma', 'BeatTheHeat', 'danny@gmail.com', 'admin'),
('Marky Mark', 'FunkyB', 'marky@yahoo.com', 'goodvibes'),
('Baby Yoda', 'mandoDisneyLover', 'yoda@starwars.com', 'jediking')
;
