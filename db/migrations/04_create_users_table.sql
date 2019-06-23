\c chitter
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(40),
  username VARCHAR(30),
  email VARCHAR(50),
  password VARCHAR(20));
\c chitter_test
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(40),
  username VARCHAR(30),
  email VARCHAR(50),
  password VARCHAR(20));
