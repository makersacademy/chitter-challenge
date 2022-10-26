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
  creation_time timestamp,
  link_to int,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);