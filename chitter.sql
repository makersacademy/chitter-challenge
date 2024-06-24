-- file: chitter_database.sql

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text,
  UNIQUE (username, email)
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  posted_at timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

-- Create the join table.
CREATE TABLE tags (
  peep_id int,
  user_id int,
  constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  PRIMARY KEY (peep_id, user_id)
);
