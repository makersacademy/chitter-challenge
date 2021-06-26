CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(60),
  password VARCHAR(60),
  tweet_id INT REFERENCES tweets (id)
  );