DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  password text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("username", "genre") VALUES
('The_flash', 'fast'),
('Kal-el', 'Super'),
('Batman', 'rich');
('Spider-man', 'webhead')