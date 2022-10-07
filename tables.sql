

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email varchar(319),
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  created_at text,     
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);