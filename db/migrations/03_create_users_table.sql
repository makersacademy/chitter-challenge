CREATE TABLE users
(
  id serial PRIMARY KEY,
  name varchar(50),
  username varchar(50) UNIQUE NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  password varchar(300) NOT NULL
);