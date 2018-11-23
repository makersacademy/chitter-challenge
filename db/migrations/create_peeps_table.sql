CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  time_stamp TIMESTAMP NOT NULL,
  peep varchar(140) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
);
