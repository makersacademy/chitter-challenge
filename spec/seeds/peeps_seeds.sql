DROP TABLE IF EXISTS peeps CASCADE;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  time_posted timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
      on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("message", "time_posted", "user_id") VALUES
('posting my first peep', '2023-02-10 01:45', '1'),
('posting my second peep', '2023-02-08 01:34', '1'),
('loving chitter', '2023-02-06 11:03', '2'),
('onto my second peep', '2023-02-01 15:56', '2'),
('user number three coming up', '2023-02-01 12:34', '3'),
('peeping once more', '2023-02-01 15:23', '3');