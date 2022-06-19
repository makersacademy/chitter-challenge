CREATE TABLE users(
  id serial,
  username VARCHAR(20) NOT NULL,
  email VARCHAR(60),
  password VARCHAR(60), PRIMARY KEY (id)
);