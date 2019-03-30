CREATE DATABASE chitter_test_2;

\c chitter_test_2

CREATE TABLE users
(
  id serial PRIMARY KEY,
  name varchar(50),
  username varchar(50) UNIQUE NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  password varchar(300) NOT NULL
);

CREATE TABLE peeps
(
  id serial PRIMARY KEY,
  user_id int,
  peep varchar(240) NOT NULL,
  peep_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

