CREATE TABLE peeps(
  id SERIAL PRIMARY KEY,
  content VARCHAR(60) NOT NULL,
  user_id int NOT NULL,
  time_stamp timestamp NOT NULL DEFAULT NOW(),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id)
);
