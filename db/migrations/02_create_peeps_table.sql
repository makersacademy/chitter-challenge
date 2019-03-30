CREATE TABLE peeps
(
  id serial PRIMARY KEY,
  user_id int,
  peep varchar(240) NOT NULL,
  peep_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);