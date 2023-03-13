-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username) VALUES ('magpie@mail.com', 'magpie2023', 'Magpie', 'Mag Pie');
INSERT INTO users (email, password, name, username) VALUES ('mockingbird@mail.com', 'mockingbird2023', 'Mockingbird', 'Mocking Bird');
INSERT INTO users (email, password, name, username) VALUES ('nightingale@mail.com', 'nightingale2023', 'Nightingale', 'Night Ingale');

INSERT INTO peeps (content, date_time, user_id) VALUES ('Mag mag mag Pie', '2023-01-08 10:00:00', '1');
INSERT INTO peeps (content, date_time, user_id) VALUES ('Mock mock mock Ingbird', '2023-01-10 13:30:00', '2');
INSERT INTO peeps (content, date_time, user_id) VALUES ('Night night night Ingale', '2023-01-13 18:20:00', '3');
