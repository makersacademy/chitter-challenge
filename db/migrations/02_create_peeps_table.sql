CREATE TABLE peeps(
  id SERIAL PRIMARY KEY,
  content VARCHAR(280),
  timestamp TIMESTAMP,
  user_id INTEGER REFERENCES users (id)
);
