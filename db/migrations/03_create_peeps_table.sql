CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  time TIMESTAMP,
  username VARCHAR(20) REFERENCES users(username),
  content VARCHAR(200)
);
