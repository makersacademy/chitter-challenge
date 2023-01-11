TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO peeps (content, timestamp, user_id) VALUES ('First peep on chitter!', '2023-01-11 09:40:00', 1);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Second peep on chitter!', '2023-01-11 09:44:00', 1);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Third peep on chitter!', '2023-01-11 09:46:00', 1);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Here we go!', '2023-01-11 09:49:00', 2);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Great user experience', '2023-01-11 09:51:00', 3);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('How do I use this thing?', '2023-01-11 09:54:00', 4);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Checking in!', '2023-01-11 09:59:00', 5);

INSERT INTO users (username, email, password) VALUES ('brugalheimer', 'josephburgess@gmail.com', crypt('password', gen_salt('bf')));
INSERT INTO users (username, email, password) VALUES ('eliseboom', 'elise@gmail.com', crypt('password2', gen_salt('bf')));
INSERT INTO users (username, email, password) VALUES ('bearsuit1', 'simon@gmail.com', crypt('password3', gen_salt('bf')));
INSERT INTO users (username, email, password) VALUES ('totebagfan', 'james@gmail.com', crypt('password4', gen_salt('bf')));
INSERT INTO users (username, email, password) VALUES ('sabcoogs', 'sabrina@gmail.com', crypt('password5', gen_salt('bf')));
