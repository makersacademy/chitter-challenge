CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  user_name text,
  password text,
  logged_in boolean 
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  date_time time,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
