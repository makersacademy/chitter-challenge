CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text UNIQUE NOT NULL,
  password text NOT NULL,
  name text NOT NULL,
  username text UNIQUE NOT NULL
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text NOT NULL,
  content text NOT NULL,
  create_at TIMESTAMPTZ DEFAULT Now(), 
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);