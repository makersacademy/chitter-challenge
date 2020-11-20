CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  user_id int NOT NULL REFERENCES users(id),
  content VARCHAR(180),
  date DATE,
  time TIME
);
