CREATE TABLE messages(
  id SERIAL PRIMARY KEY, 
  text VARCHAR(280), 
  created_at TIMESTAMP WITHOUT TIME ZONE, 
  user_id INT REFERENCES users(id)
);

