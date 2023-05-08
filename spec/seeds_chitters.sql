-- EXAMPLE
-- (file: spec/seeds_chitters.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE chitters RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO chitters (peep, created_at, user_id) VALUES ('flying solo', CURRENT_TIMESTAMP, 2);
INSERT INTO chitters (peep, created_at, user_id) VALUES ('falling', CURRENT_TIMESTAMP, 2);
INSERT INTO chitters (peep, created_at, user_id) VALUES ('dead', CURRENT_TIMESTAMP, 3);