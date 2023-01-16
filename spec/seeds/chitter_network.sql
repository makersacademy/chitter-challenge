DROP TABLE if exists accounts;

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email text,
  username text,
  password text,
  name text

);

INSERT INTO accounts ("email", "username", "password", "name") VALUES
('johnsmith@makers.com', 'jsmith98', 'abc123!!', 'John Smith'),
('benking@makers.com', 'bking98', 'def456??', 'Ben King'),
('chrisbacon@makers.com', 'cbacon98', 'ghi789!!', 'Chris Bacon');

-- Then the table with the foreign key first.
DROP TABLE if exists peeps;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  time time,
-- The foreign key name is always {other_table_singular}_id
  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);

INSERT INTO peeps ("message", "time", "account_id") VALUES
('Today will be a good day', '09:15', 1),
('I am bored who is out?', '11:30', 3),
('Arsenal playing, buzzing!', '15:10', 2),
('Twisted my ankle today :(', '18:45', 1),
('Good win!', '22:00', 2);