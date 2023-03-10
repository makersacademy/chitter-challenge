DROP TABLE IF EXISTS users, peers; 

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
  datetime timestamp DEFAULT now()::timestamp(0),
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);