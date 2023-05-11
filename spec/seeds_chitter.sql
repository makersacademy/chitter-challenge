-- (file: spec/seeds_chitter.sql)

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE peeps, users, peeps_users RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email, username, password) VALUES ('Caroline', 'carolinesemail@email.com', 'caro', '$2a$12$RWbFtjHnA3kC2Gt31m7/l.N4f8ISipDp9T7KIyvSHhww/sGqohGHS');
INSERT INTO users (name, email, username, password) VALUES ('Philip', 'philsemail@email.com', 'phil', '$2a$12$BV.yJVJm0fDOX0ikKe/6V.DjV5T4KqfMzWUh5B0Yd.QDIOGdyLNIK');

-- the two passwords are 'pwtest1' and 'pwtest2'

INSERT INTO peeps (content, time, user_id) VALUES ('This is the first Peep', '20230506 10:22:09 AM', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the second Peep', '20230507 03:35:35 PM', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the third Peep', '20230508 09:42:01 AM', 2);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the forth Peep', '20230509 11:12:59 PM', 2);

INSERT INTO peeps_users (peep_id, user_id) VALUES (1, 2);
INSERT INTO peeps_users (peep_id, user_id) VALUES (2, 2);