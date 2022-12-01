TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (name, email, password, username) VALUES ('First Name', 'firstname@email.com', 'abc123', 'firstname');
INSERT INTO users (name, email, password, username) VALUES ('Second Name', 'secondname@email.com', 'defgh456', 'secondname');

INSERT INTO posts (content, time, user_id) VALUES ('This is an example post from username firstname', '22022-01-08 04:05:06', 1);
INSERT INTO posts (content, time, user_id) VALUES ('This is another example post from username firstname', '22022-01-09 18:00:05', 1);
INSERT INTO posts (content, time, user_id) VALUES ('This is an example post from username firstname', '22022-01-08 05:02:03', 2);
INSERT INTO posts (content, time, user_id) VALUES ('This is another example post from username firstname', '22022-01-09 20:0:06', 2);