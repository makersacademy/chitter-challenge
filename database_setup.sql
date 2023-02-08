CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  time date,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);