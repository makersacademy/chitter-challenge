CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content VARCHAR(140),
  date DATE,
  time TIME,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users (id)
);
