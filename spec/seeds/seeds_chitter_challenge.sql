-- file: seeds_chitter_challenge.sql
-- Replace the table name, columm names and types.
-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  username text,
  name text
);

-- Then the table with the foreign key first.
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  tags text,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  posted_by text,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);