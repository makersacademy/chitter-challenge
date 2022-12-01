-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email_address text,
  password text,
  name text,
  username text
);

-- Then the table with the foreign key.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date_and_time timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

-- Then the table with the foreign key.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  date_and_time timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade,
  -- The foreign key name is always {other_table_singular}_id
  peep_id int,
  constraint fk_peep foreign key(peep_id)
    references peeps(id)
    on delete cascade
);