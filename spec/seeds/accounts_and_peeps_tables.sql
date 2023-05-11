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
('alice@example.com', 'alice1', 'Alice Wood', '$2a$12$EG2Oq93fK9rGWA.5WK28Y.VhcpMXOwqyWZfsjANuOoSwa6QGRotHq'),
('chris@example.com', 'chris1', 'Chris Wood', '$2a$12$cCyDdoyGltyOwuMGgmX2zuHgAwApVH6fgcZtclo.m/ZGZqJN4OPHe'),
('will@example.com', 'will1', 'Will Davies', '$2a$12$A18MdlXlP0YgmNSDcjqRM.Oj0fqHqifApsMVo/xr5l/W8torB9VqG');

INSERT INTO peeps ("time", "contents", "account_id") VALUES
('2023-05-09 11:09:00', 'hello, this is the first peep!', 1),
('2023-05-09 11:10:30', 'Oh wow, hello @alice1! Peep!', 2),
('2023-05-09 11:12:00', 'I am peeping too! How cool', 3);

