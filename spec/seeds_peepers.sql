-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE peepers RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peepers (username, password) VALUES ('Sharon', 'Fido');
INSERT INTO peepers (username, password) VALUES ('Dazzy Dave', 'Winford Drive');
INSERT INTO peepers (username, password) VALUES ('Peter K', 'Hilltop');