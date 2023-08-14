CREATE TABLE chitters (
  id SERIAL PRIMARY KEY,
  peep text,
  created_at timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);