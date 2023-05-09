DROP TABLE IF EXISTS peeps;
DROP TABLE IF EXISTS accounts;


CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text,
  name text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  time timestamp,
  contents text,

  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;
TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;

INSERT INTO accounts ("email_address", "username", "name", "password") VALUES
('alice@test.com', 'alice1', 'Alice Wood', 'test123'),
('chris@test.com', 'chris1', 'Chris Wood', 'test321'),
('kay@test.com', 'kay1', 'Kay Lack', 'test987');

INSERT INTO peeps ("time", "contents", "account_id") VALUES
('2023-05-09 11:09:00', 'hello, this is the first peep!', 1),
('2023-05-09 11:10:30', 'hello, this is the second peep!', 2),
('2023-05-09 11:12:00', 'hello, this is the third peep!', 3);

