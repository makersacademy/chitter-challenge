DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  username text,
  full_name text,
  password text
);

DROP TABLE IF EXISTS peeps;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  created_date_time timestamp,
  user_id int4,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);