CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username varchar(20) NOT NULL UNIQUE,
  name varchar(40) NOT NULL,
  email char(254) NOT NULL UNIQUE,
  password char(128) NOT NULL
);
