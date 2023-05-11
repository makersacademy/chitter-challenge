DROP TABLE IF EXISTS users, peeps;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time_posted timestamp,
  user_id integer,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);