CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL unique,
  password_digest TEXT NOT NULL
);