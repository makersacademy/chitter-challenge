DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text,
  name text,
  password text
);

TRUNCATE TABLE accounts RESTART IDENTITY;

INSERT INTO accounts ("email_address", "username", "name", "password") VALUES
('alice@test.com', 'alice1', 'Alice Wood', 'test123'),
('chris@test.com', 'chris1', 'Chris Wood', 'test321'),
('kay@test.com', 'kay1', 'Kay Lack', 'test987');

