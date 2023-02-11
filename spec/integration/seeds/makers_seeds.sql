DROP TABLE IF EXISTS makers; 

-- Table Definition
CREATE TABLE makers(
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email CITEXT,
  password text
);

TRUNCATE TABLE makers RESTART IDENTITY;

INSERT INTO makers ("name", "username", "email", "passoword") VALUES
--('Pixies', 'Rock'),
--('ABBA', 'Pop');
--example table insertion



