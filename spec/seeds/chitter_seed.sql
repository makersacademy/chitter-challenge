TRUNCATE TABLE users, posts RESTART IDENTITY;
DROP TABLE users, posts;



--CREATE SEQUENCE IF NOT EXISTS users_id_seq;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

INSERT INTO users ("email", "password", "name", "username") VALUES
('one@me.com', 'pass123', 'One', 'One'),
('two@me.com', 'pass234', 'Two', 'Two'),
('three@me.com', 'pass345', 'Three', 'Three');

INSERT INTO posts ("message", "time", "user_id") VALUES
('This is my first post', '2023-01-01 20:00:00', 1),
('This is my second post', '2023-01-01 22:00:00', 1),
('My turn to post', '2023-01-02 15:00:00', 3),
('Finally me', '2023-01-05 10:00:00', 2);