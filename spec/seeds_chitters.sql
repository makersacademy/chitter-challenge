-- EXAMPLE
-- (file: spec/seeds_chitters.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE chitters RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO chitters (peep, peep_time) VALUES ('flying solo', '16:20');
INSERT INTO chitters (peep, peep_time) VALUES ('falling', '16:21');
INSERT INTO chitters (peep, peep_time) VALUES ('dead', '16:22');