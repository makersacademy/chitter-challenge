CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  time_stamp TIMESTAMP DEFAULT NOW(),
  peep varchar(140) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
);
