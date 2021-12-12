CREATE TABLE messages(
  id SERIAL PRIMARY KEY, 
  text VARCHAR(280), 
  created_at TIMESTAMP WITHOUT TIME ZONE, 
  user_id INT REFERENCES users(id)
);


CREATE TABLE users(
  id SERIAL PRIMARY KEY, 
  username VARCHAR(20), 
  password VARCHAR(140)
);

CREATE TABLE replies(
  id SERIAL PRIMARY KEY, 
  text VARCHAR(280), 
  created_at TIMESTAMP WITHOUT TIME ZONE, 
  message_id INT REFERENCES messages (id),
  user_id INT REFERENCES users(id)
);