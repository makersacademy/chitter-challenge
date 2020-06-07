CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(20) UNIQUE,
  password VARCHAR(30) UNIQUE,
  email VARCHAR(30) UNIQUE
)

CREATE TABLE peeps (
  body VARCHAR(300),
  user_id INTEGER,
  datetime TIMESTAMP,
  peep_id SERIAL PRIMARY KEY,
  FOREIGN KEY (user_id) REFERENCES users(id);
)
