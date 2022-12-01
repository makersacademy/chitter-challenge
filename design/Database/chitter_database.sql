CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text,
  password text
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  content text,
  time_posted timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);