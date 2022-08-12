CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text UNIQUE,
  password text,
  name text,
  username text UNIQUE
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  timestamp text,
  name text,
  username text
);