DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  pass_word text,
  username text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("name", "email", "pass_word", "username") VALUES
('user one', 'user_one@gmail.com', 'password1', 'user_one'),
('user two', 'user_two@gmail.com', 'password2', 'user_two'),
('user three', 'user_three@gmail.com', 'password3', 'user_three');