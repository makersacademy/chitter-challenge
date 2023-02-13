
TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (username, name, email, password) VALUES('ryan__lai__', 'Ryan Lai', 'ryanlai12@gmail.com', 'abc123');

INSERT INTO posts (title, contents, time, user_id) VALUES('Title', 'Contents', '2001-07-12 09:00:00', 1);
INSERT INTO posts (title, contents, time, user_id) VALUES('Title 2', 'Contents 2', '2001-07-12 10:00:00', 1);