CREATE DATABASE chitter;

CREATE EXTENSION pgcrypto;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  username TEXT NOT NULL UNIQUE
);

# Example User
INSERT INTO users (email, password, name, username) VALUES (
  'johndoe@mail.com', 
  crypt('johnspassword', gen_salt('bf')), 
  'John Doe', 
  'johndoe1' 
);