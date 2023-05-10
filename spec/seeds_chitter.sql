TRUNCATE TABLE peeps, users RESTART IDENTITY;


INSERT INTO users (name, email, username) VALUES ('Jack', 'jack@email.com', 'skates');
INSERT INTO users (name, email, username) VALUES ('Dave', 'dave@email.com', 'dave123');


INSERT INTO peeps (content, time, user_id) VALUES ('This is the first Peep', '20230506 12:22:09 PM', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the second Peep', '20230507 05:45:35 PM', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the third Peep', '20230508 09:42:01 AM', 2);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the forth Peep', '20230509 11:12:59 PM', 2);
