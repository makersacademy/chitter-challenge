
-- TRUNCATE TABLE users, posts RESTART IDENTITY;
-- Uncomment the line above to clear all the values in the database

DROP TABLE IF EXISTS "public"."users";

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  name text,
  email text,
  password text
);

DROP TABLE IF EXISTS "public"."posts";

-- Table Definition
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  contents text,
  time timestamp,
  user_id int
);

INSERT INTO users (username, name, email, password) VALUES('ryan__lai__', 'Ryan Lai', 'ryanlai12@gmail.com', 'abc123');

INSERT INTO posts (title, contents, time, user_id) VALUES('Title', 'Contents', '2001-07-12 09:00:00', 1);
INSERT INTO posts (title, contents, time, user_id) VALUES('Title 2', 'Contents 2', '2001-07-12 10:00:00', 1);


