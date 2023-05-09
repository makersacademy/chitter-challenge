DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text,
  password text
);

TRUNCATE TABLE accounts RESTART IDENTITY;

INSERT INTO accounts ("email_address", "username", "password") VALUES
('alice@test.com', 'alice1', 'test123'),
('chris@test.com', 'chris1', 'test321'),
('test@test.com', 'test1', 'test987')