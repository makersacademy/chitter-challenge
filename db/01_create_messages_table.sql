CREATE TABLE messages(
  msg_id serial PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  msg VARCHAR(280) NOT NULL,
  created_on TIMESTAMP NOT NULL);