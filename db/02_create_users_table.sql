CREATE TABLE users(
  user_id serial PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password_hash CHAR(192) NOT NULL,
  email VARCHAR(50) NOT NULL);