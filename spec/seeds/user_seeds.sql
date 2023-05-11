DROP TABLE IF EXISTS user_account; 

CREATE TABLE user_account (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text,
  name text,
  password text
);

TRUNCATE TABLE user_account RESTART IDENTITY;

INSERT INTO user_account ("email_address", "username", "name", "password") VALUES
('shrek@swamp.com', 'fionalover420', 'Shrek', 'I_Love_Fiona_69');