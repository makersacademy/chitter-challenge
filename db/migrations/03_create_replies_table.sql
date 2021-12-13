CREATE TABLE replies(
  id SERIAL PRIMARY KEY, 
  text VARCHAR(280), 
  created_at TIMESTAMP WITHOUT TIME ZONE, 
  message_id INT REFERENCES messages (id),
  user_id INT REFERENCES users(id)
);