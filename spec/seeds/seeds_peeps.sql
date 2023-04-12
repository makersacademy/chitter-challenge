DROP TABLE IF EXISTS peeps;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  content text,
  created_date_time timestamp,
  user_id int4
);

TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;

INSERT INTO peeps(content, created_date_time, user_id) VALUES
('My first peep', CURRENT_TIMESTAMP, 1);