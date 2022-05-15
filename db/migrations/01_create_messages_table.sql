CREATE TABLE messages(id SERIAL PRIMARY KEY, peep VARCHAR(240));

INSERT INTO
  messages (peep)
VALUES
  ('I love Chitter!'),
  ('How do I peep?'),
  ('This is so fun.');

Creating test data base

CREATE DATABASE chitter_messenger_test;

CREATE TABLE messages(id SERIAL PRIMARY KEY, peep VARCHAR(240));




