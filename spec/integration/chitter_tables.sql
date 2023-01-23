CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content TEXT,
  timestamp timestamp,
  user_id INT
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL
);