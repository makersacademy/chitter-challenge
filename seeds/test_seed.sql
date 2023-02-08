
TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (username, password) VALUES('ryan', 'abc123');

INSERT INTO posts (title, contents, time, user_id) VALUES('Hello Guys', 'I like this app.', '2001-07-12 09:00:00+01', 1);