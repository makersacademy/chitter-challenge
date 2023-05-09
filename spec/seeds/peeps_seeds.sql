DROP TABLE IF EXISTS peeps CASCADE;


CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  time timestamp,
  contents text,

  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY ;

INSERT INTO peeps ("time", "contents", "account_id") VALUES
('2023-05-09 11:09:00', 'hello, this is the first peep!', 1),
('2023-05-09 11:10:30', 'hello, this is the second peep!', 2),
('2023-05-09 11:12:00', 'hello, this is the third peep!', 3);