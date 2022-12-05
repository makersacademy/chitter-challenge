Users Model and Repository Classes Design Recipe

Copy this recipe template to design and implement Model and Repository classes for a database table.

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table students

# EXAMPLE

Table: peeps

Columns:
id | email_address | password 

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY;
ALTER SEQUENCE users_id_seq RESTART WITH 1;

INSERT INTO users (email_address, password) VALUES ('Callum@gmail.com', 'God0fwar');
INSERT INTO users (email_address, password) VALUES ('Cecily@gmail.com', 'AnimalCr0ssing');


Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 chitter_challenge < spec/seeds/seeds_peeps.sql
