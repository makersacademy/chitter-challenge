DROP TABLE IF EXISTS users, peeps;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email text,
  password text,
  name text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  post_time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);