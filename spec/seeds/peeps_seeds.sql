DROP TABLE IF EXISTS peeps;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  user_id int
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("content", "user_id") VALUES
('Hey all, Im the flash, the fastets man alive!', 1),
('Good Morning America, it is I Superman!', 2),
('Im Batman', 3);
('Hey yall its your friendly neighbourhood spider-man!', 4)