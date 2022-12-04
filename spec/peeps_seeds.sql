DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  contents text,
  time timestamp,
  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (contents, time, account_id) VALUES
('Contents 1', '2022-12-01 01:08:54.193', 1),
('Contents 2', '2022-12-01 05:08:54.193', 2),
('Contents 3', '2022-12-01 10:08:54.193', 3),
('second peep', '2022-12-01 15:08:54.193', 1),
('Another peep', '2022-12-01 20:08:54.193', 2),
('Trump for president', '2022-12-01 23:08:54.193', 4);