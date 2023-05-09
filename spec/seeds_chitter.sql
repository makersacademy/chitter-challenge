-- (file: spec/seeds_chitter.sql)

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE peeps, users, peeps_users RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email, username) VALUES ('Caroline', 'carolinesemail@email.com', 'caro');
INSERT INTO users (name, email, username) VALUES ('Philip', 'philsemail@email.com', 'phil');


INSERT INTO peeps (content, time, user_id) VALUES ('This is the first Peep', '20230506 10:22:09 AM', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the second Peep', '20230507 03:35:35 PM', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the third Peep', '20230508 09:42:01 AM', 2);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the forth Peep', '20230509 11:12:59 PM', 2);

INSERT INTO peeps_users (peep_id, user_id) VALUES (1, 2);
INSERT INTO peeps_users (peep_id, user_id) VALUES (2, 2);