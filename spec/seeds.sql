TRUNCATE TABLE peeps, users RESTART IDENTITY;

-- Encrypt passwords using bcrypt
INSERT INTO users (email_address, username, password)
VALUES ('sidra@fake.com', 'sidra_fake', crypt('12345', gen_salt('bf')));
INSERT INTO users (email_address, username, password)
VALUES ('bobby@fake.com', 'bobby_fake', crypt('password', gen_salt('bf')));
INSERT INTO users (email_address, username, password)
VALUES ('tina@fake.com', 'tina_fake', crypt('password123', gen_salt('bf')));

INSERT INTO peeps (time, contents, user_id) VALUES ('2023-04-12 12:03:00', 'This is my post', '1');
INSERT INTO peeps (time, contents, user_id) VALUES ('2023-04-13 12:16:00', 'Here is my new post', '2');
INSERT INTO peeps (time, contents, user_id) VALUES ('2023-04-14 12:19:00', 'Here is my other post', '1');
INSERT INTO peeps (time, contents, user_id) VALUES ('2023-04-15 12:10:00', 'User 3 newer post', '3');


