CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  date date,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);