CREATE TABLE tweets(
  id SERIAL PRIMARY KEY, 
  tweet VARCHAR(120), 
  time VARCHAR(60),
  user_id INT REFERENCES users (id)
  );