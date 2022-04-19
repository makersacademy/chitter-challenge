CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(60),
  username VARCHAR(60),
  email VARCHAR(100),
  password VARCHAR(100));