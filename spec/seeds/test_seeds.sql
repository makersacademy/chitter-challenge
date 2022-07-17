TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE POSTS RESTART IDENTITY;

INSERT INTO users (name, email, username, password) VALUES ('user1', 'user1@email.com', 'username1', 'password1');
INSERT INTO users (name, email, username, password) VALUES ('user2', 'user2@email.com', 'username2', 'password2');

INSERT INTO posts (content, time, user_id) VALUES ('content1', '2022-07-15 11:31:00', 1);
INSERT INTO posts (content, time, user_id) VALUES ('content2', '2022-07-15 11:32:00', 2);
