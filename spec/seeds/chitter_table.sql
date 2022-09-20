CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  name text,
  username text,
  password text
);


CREATE TABLE peeps (
  id SERIAL PRIMARY KEY, 
  username text,
  name text,
  content text,
  time time,

  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
