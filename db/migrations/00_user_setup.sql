-- CREATE DATABASE chitter;
-- CREATE DATABASE chitter_test;

-- CREATE EXTENSION pgcrypto;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  username TEXT NOT NULL UNIQUE
);
