TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE posts RESTART IDENTITY CASCADE;
TRUNCATE TABLE comments RESTART IDENTITY CASCADE;
TRUNCATE TABLE tags RESTART IDENTITY CASCADE;

INSERT INTO users (name, username, email, password) VALUES
('John Smith', 'JS', 'js@gmail.com', 'passwordJS'),
('Nikki Wong', 'NickNack', 'nicknack@gmail.com', 'password2'),
('Liam Banks', 'Liam', 'liambanks@gmail.com', 'password3');

INSERT INTO posts (peep, time, user_id) VALUES ('this is my first post', 'Jan-08-2023 10:30', 1),
('Any film recommends?', 'Jan-09-2023 14:00', 2);

INSERT INTO comments (comment, time, post_id) VALUES ('Welcome to chitter!', 'Jan-08-2023 11:00', 1),
('yes! Everything Everywhere film!', 'Jan-09-2023 12:00', 2);

INSERT INTO tags (tag, post_id, user_id) VALUES
('NickNack', 1, 2),
('Liam', 2, 3);

ALTER TABLE tags ADD FOREIGN KEY (post_id) REFERENCES posts(id);
ALTER TABLE tags ADD FOREIGN KEY (user_id) REFERENCES users(id);
