DROP TABLE IF EXISTS peeps CASCADE; 

-- Table Definition
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time_created timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("content", "time_created", "user_id") VALUES
('this is my first peep', current_timestamp, '1'),
('this is my second peep', current_timestamp, '1'),
('I love chitter', current_timestamp, '2'),
('many peeps, much chitter', current_timestamp, '2'),
('chitty chitty peep', current_timestamp, '3'),
('peepy chit chit', current_timestamp, '3')


