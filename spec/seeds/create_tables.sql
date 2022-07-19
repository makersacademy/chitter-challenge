CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text
  password text
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  time text,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id) references users(id)
);