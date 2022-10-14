DROP TABLE IF EXISTS users; 

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email_address varchar, 
  password char(20)
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("name", "username", "email_address", "password") VALUES
('Jack', 'Jack_user', 'Jacks_email', 'Jack_password'),
('Rosa', 'Rosa_user', 'Rosa_email', 'Rosa_password'),
('Timothy', 'Timothy_user', 'Timothy_email', 'Timothy_password'),
('Kyle', 'Kyle_user', 'Kyle_email', 'Kyle_password'),
('Kate', 'Kate_user', 'Kate_email', 'Kate_password');

