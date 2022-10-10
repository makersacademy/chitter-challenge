TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.
TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES ('user1', 'username1', 'user1@fakeemail.com', 'fakepassword1');
INSERT INTO users (name, username, email, password) VALUES ('user2', 'username2', 'user2@fakeemail.com', 'fakepassword2');

INSERT INTO peeps (context, time_and_date, user_id) VALUES ('peep 1 context', '2022-10-06 09:46:42', '1');
INSERT INTO peeps (context, time_and_date, user_id) VALUES ('peep 2 context', '2022-10-06 07:48:42', '1');
INSERT INTO peeps (context, time_and_date, user_id) VALUES ('peep 3 context', '2022-10-05 09:48:42', '2');
INSERT INTO peeps (context, time_and_date, user_id) VALUES ('peep 4 context', '2022-10-05 09:40:42', '2');