CREATE TABLE peeps
(
  id SERIAL PRIMARY KEY,
  body VARCHAR(140),
  time TIMESTAMP DEFAULT NOW(),
  username VARCHAR(30)
);

CREATE TABLE users
(
  username VARCHAR PRIMARY KEY(25), 
  email VARCHAR(75), 
  name VARCHAR(30), 
  password VARCHAR(10)
);