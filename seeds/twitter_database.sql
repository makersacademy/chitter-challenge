
-- TRUNCATE TABLE users, posts RESTART IDENTITY;
-- Uncomment the line above to clear all the values in the database

DROP TABLE IF EXISTS "public"."users";

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  password text,
);

DROP TABLE IF EXISTS "public"."posts";

-- Table Definition
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  contents text,
  time timestamptz,
  user_id int
);

INSERT INTO users (username, password) VALUES('ryan', 'abc123');

INSERT INTO posts (title, contents, time, user_id) VALUES('Hello Guys', 'I like this app.', '2001-07-12 09:00:00+01', 1);


