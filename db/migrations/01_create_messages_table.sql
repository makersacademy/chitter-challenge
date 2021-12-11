CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(280), created_at TIMESTAMP WITHOUT TIME ZONE);
CREATE TABLE users(
  id SERIAL PRIMARY KEY, 
  username VARCHAR(20), 
  password VARCHAR(140),
  user_id int,
  FOREIGN KEY (user_id) REFERENCES users(id)
);