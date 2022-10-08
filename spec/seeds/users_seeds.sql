DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  name text,
  username text,
  password text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("email", "name", "username", "password") VALUES
('barrya@gmail.com', 'Barry Allen', 'The_flash', 'fast'),
('clarkk@dailyplanet.com', 'Clark Kent', 'Kal-el', 'Super'),
('brucew@wayneindustries.com', 'Bruce Wayne', 'Batman', 'rich');
('peterp@esu.org.uk', 'Peter Parker', 'Spider-man', 'webhead')