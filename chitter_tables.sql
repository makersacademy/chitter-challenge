CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email varchar(50),
  username varchar(50) NOT NULL,
  password varchar(50) NOT NULL
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message varchar,
  time TIMESTAMP,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);