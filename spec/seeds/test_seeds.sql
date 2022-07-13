TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE posts RESTART IDENTITY;


INSERT INTO users (name, email, username, password) VALUES ('Bob', 'bobby@makers.com', 'BigBob', 'abc123');
INSERT INTO users (name, email, username, password) VALUES ('Jay', 'jayjay@makers.com', 'HugeJay', 'mypass');

INSERT INTO posts (content, time, user_id) VALUES ('First post', '1999-01-08 04:05:06', 1);
INSERT INTO posts (content, time, user_id) VALUES ('Hi my name is Jay', '2022-06-01 19:19:19', 2);
