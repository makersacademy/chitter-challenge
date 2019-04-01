-- # Create DB
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test`;

CREATE TABLE peep_messages (
  id SERIAL PRIMARY KEY,
  message VARCHAR(60),
  timestamp TIMESTAMPTZ default CURRENT_TIMESTAMP
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  fullname VARCHAR(60),
  username VARCHAR(60),
  email VARCHAR(60),
  password VARCHAR(128)
  );

ALTER TABLE peep_messages
ADD COLUMN user_id int,
ADD FOREIGN KEY (user_id) REFERENCES Users(id);

ALTER TABLE peep_messages
ADD COLUMN username VARCHAR(60);