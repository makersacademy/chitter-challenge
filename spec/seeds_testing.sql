TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (username, email) VALUES('David', 'david@gmail.com');
INSERT INTO users (username, email) VALUES('Anna', 'anna@msn.com');

INSERT INTO posts (title, content, number_of_views, user_id) VALUES('Day 1', 'lol haha', 5, 1);
INSERT INTO posts (title, content, number_of_views, user_id) VALUES('Day 2', 'biscuit tin', 11, 1);