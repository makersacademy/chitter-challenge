SET client_min_messages = WARNING;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
-- Define the table structure
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

-- Clear existing data and reset the auto-incrementing ID
TRUNCATE TABLE users RESTART IDENTITY;

-- Helper function to encrypt passwords using BCrypt
CREATE OR REPLACE FUNCTION encrypt_password(password text)
  RETURNS text AS $$
  DECLARE
    hashed_password text;
  BEGIN
    hashed_password := crypt(password, gen_salt('bf'));
    RETURN hashed_password;
  END;
$$ LANGUAGE plpgsql;

-- Insert user records with encrypted passwords
INSERT INTO users ("name", "username", "email", "password") VALUES
('Joe Hannis', 'joehannis', 'joehannis@gmail.com', encrypt_password('passwordjoe')),
('Jake Hannis', 'jakehannis', 'jakehannis@gmail.com', encrypt_password('passwordjake')),
('Lauren Hannis', 'laurenhannis', 'laurenhannis@gmail.com', encrypt_password('passwordlauren')),
('Luna Hannis', 'lunahannis', 'lunahannis@gmail.com', encrypt_password('passwordluna'));