CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date_time text,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);