DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  name text,
  email text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  time_posted timestamp,
  parent_id int,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
