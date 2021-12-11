CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(280), created_at TIMESTAMP WITHOUT TIME ZONE);

CREATE TABLE users(
  id SERIAL PRIMARY KEY, 
  username VARCHAR(20), 
  password VARCHAR(140),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies(
  id SERIAL PRIMARY KEY, 
  text VARCHAR(280), 
  created_at TIMESTAMP WITHOUT TIME ZONE, 
  message_id INT REFERENCES messages (id));