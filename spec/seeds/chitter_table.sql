CREATE TABLE users ( id SERIAL PRIMARY KEY,
name text, username text, email text, password text
);

CREATE TABLE peeps ( 
  id SERIAL PRIMARY KEY, title text,
  content text, time text, user_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade
);