TRUNCATE TABLE users RESTART IDENTITY CASCADE;
INSERT INTO users (name, email_address, username, password) VALUES ('Jude', 'jude@jude.com', 'jude94', 'topsecret123');
INSERT INTO users (name, email_address, username, password) VALUES ('Abbie', 'abbie@abbie.com', 'abbie236', 'passsword111');
INSERT INTO users (name, email_address, username, password) VALUES ('Billy', 'billy@billy.com', 'billy_1956', 'dontguessme99');
INSERT INTO users (name, email_address, username, password) VALUES ('Mo', 'mo@mo.com', 'mo**11', 'qwertyuiop');

TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;
INSERT INTO peeps (content, time_posted, user_id) VALUES ('First peep ever on chitter!!!!', '2022-11-30 12:00:00', 1);
INSERT INTO peeps (content, time_posted, user_id) VALUES ('Happy New Year', '2022-11-30 12:01:00', 2);
INSERT INTO peeps (content, time_posted, user_id) VALUES ('My favourite colour is bread', '2022-11-30 12:02:00', 3);
INSERT INTO peeps (content, time_posted, user_id) VALUES ('I wonder if chitter will ever catch on', '2022-11-30 12:03:00', 4);
INSERT INTO peeps (content, time_posted, user_id) VALUES ('Is it raining?', '2022-11-30 12:04:00', 1);
INSERT INTO peeps (content, time_posted, user_id) VALUES ('Something deep and meaningful probably', '2022-11-30 12:05:00', 2);
INSERT INTO peeps (content, time_posted, user_id) VALUES ('I like crisps', '2022-11-30 12:06:00', 3);
INSERT INTO peeps (content, time_posted, user_id) VALUES ('Eleven is bigger than ten', '2022-11-30 12:07:00', 4);

TRUNCATE TABLE comments RESTART IDENTITY CASCADE;
INSERT INTO comments (content, comment_time_posted, peep_id, user_id) VALUES ('This peep is great', '2022-11-30 12:08:00', 1, 4);
INSERT INTO comments (content, comment_time_posted, peep_id, user_id) VALUES ('This is a comment', '2022-11-30 12:09:00', 2, 3);
INSERT INTO comments (content, comment_time_posted, peep_id, user_id) VALUES ('I am commenting', '2022-11-30 12:10:00', 3, 2);
INSERT INTO comments (content, comment_time_posted, peep_id, user_id) VALUES ('Listen to me', '2022-11-30 12:11:00', 4, 1);
INSERT INTO comments (content, comment_time_posted, peep_id, user_id) VALUES ('I disagree', '2022-11-30 12:12:00', 2, 4);