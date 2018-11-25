CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  user_name varchar(60) UNIQUE,
  email varchar(60) UNIQUE,
  password varchar(60)
);
