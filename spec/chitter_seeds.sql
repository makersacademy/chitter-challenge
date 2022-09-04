CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  name text,
  email text,
  password text
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  post_time timestamp,
  tagged_users text,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);  