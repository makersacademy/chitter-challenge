CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(60),
  email VARCHAR(60) UNIQUE,
  password VARCHAR(28),
  username VARCHAR(28) UNIQUE
);