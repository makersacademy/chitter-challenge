DROP TABLE IF EXISTS users CASCADE; 

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  password text,
  username text
);

DROP TABLE IF EXISTS posts; 

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
