CREATE DATABASE chitter_test;
\c chitter_test;
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY, 
  content VARCHAR(240), 
  user_id INTEGER REFERENCES users (id), 
  time_created TIME
  );
CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  username VARCHAR(30), 
  email VARCHAR(60), 
  password VARCHAR(100)
  );
INSERT INTO users (id, username, email, password) VALUES('1', 'username', 'test@test.com', '$2a$12$DXl8ehH9k2brLxQJruQ0.uUThLIWtKUZoOg1YgYCa9enzNkr3fa8W');
INSERT INTO peeps (id, content, user_id, time_created) VALUES('1', 'a peep', '1', '18:12:58');
