-- file: chitter_table.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username TEXT,
  password TEXT,
  email TEXT
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content TEXT,
  timestamp TIMESTAMP,
  tags TEXT,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
