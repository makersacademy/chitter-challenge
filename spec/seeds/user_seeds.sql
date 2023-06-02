DROP TABLE IF EXISTS users CASCADE;

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email text,
  password text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("username", "email", "password") VALUES
('joehannis', 'joehannis@gmail.com', 'passwordjoe'),
('jakehannis', 'jakehannis@gmail.com', 'passwordjake'),
('laurenhannis', 'laurenhannis@gmail.com', 'passwordlauren'),
('lunahannis', 'lunahannis@gmail.com', 'passwordluna');
