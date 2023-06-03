DROP TABLE IF EXISTS users CASCADE;

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("name", "username", "email", "password") VALUES
('Joe Hannis', 'joehannis', 'joehannis@gmail.com', 'passwordjoe'),
('Jake Hannis', 'jakehannis', 'jakehannis@gmail.com', 'passwordjake'),
('Lauren Hannis', 'laurenhannis', 'laurenhannis@gmail.com', 'passwordlauren'),
('Luna Hannis', 'lunahannis', 'lunahannis@gmail.com', 'passwordluna');
