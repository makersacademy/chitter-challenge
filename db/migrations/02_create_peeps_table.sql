CREATE TABLE peeps(
  id SERIAL PRIMARY KEY,
  content VARCHAR(60) NOT NULL,
  user_id int,
  time_stamp timestamp NOT NULL DEFAULT NOW(),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id)
);


-- CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(60), user_id VARCHAR(20), time_stamp timestamp);