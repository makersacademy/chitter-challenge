CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  password text,
  username text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  timestamp timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);