DROP TABLE messages;

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  text VARCHAR(250),
  time TIME DEFAULT NOW(), 
  date DATE DEFAULT NOW(), 
  user_id INT, 
  FOREIGN KEY (user_id) REFERENCES users (id) );