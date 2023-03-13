
TRUNCATE TABLE users, peeps RESTART IDENTITY;
 -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.


INSERT INTO users (username, email_address, password) VALUES ('jamespates', 'james@gmail.com', 'Abc123De');
INSERT INTO users (username, email_address, password) VALUES ('amy_pates', 'amy@gmail.com', 'Abc123Df');
INSERT INTO users (username, email_address, password) VALUES ('ann_pates', 'ann@gmail.com', 'Abc123Dg');
INSERT INTO peeps (message, time_of_post, user_id) VALUES ('A good day', '2023-03-09 10:15:30.123456', '1');
INSERT INTO peeps (message, time_of_post, user_id) VALUES ('A bad day', '2023-03-08 10:15:30.123456', '2');
INSERT INTO peeps (message, time_of_post, user_id) VALUES ('An ok day', '2023-03-07 10:15:30.123456', '3');