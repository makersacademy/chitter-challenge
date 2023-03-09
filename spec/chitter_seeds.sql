CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  fullname TEXT,
  username TEXT,
  email VARCHAR(255) NOT NULL,
  password_digest TEXT NOT NULL
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  time TIMESTAMP,
  content TEXT,
  user_id INT,
  CONSTRAINT fk_user FOREIGN KEY(user_id) 
  REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE peeps_users (
user_id INT,
peep_id INT,
CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
CONSTRAINT fk_peep FOREIGN KEY(peep_id) REFERENCES peeps(id) ON DELETE CASCADE
);

