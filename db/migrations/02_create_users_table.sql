CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(60),
  password VARCHAR(140),
  name VARCHAR(60),
  username VARCHAR(60)
);
