CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(40),
  password VARCHAR(20),
  name VARCHAR(50),
  username VARCHAR(20))

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content VARCHAR(140),
  date DATE,
  time TIME,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users (id)
);
