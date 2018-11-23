CREATE TABLE peeps2 (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  content VARCHAR(140),
  timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users (id)
);
