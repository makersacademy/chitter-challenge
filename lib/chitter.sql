DROP TABLE IF EXISTS "public"."users" CASCADE; 

CREATE SEQUENCE IF NOT EXISTS users_id_seq;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

INSERT INTO "public"."users" ("name", "username", "email", "password") VALUES
('Moe', 'moeee', 'moeee@email.com', 'password111'),
('Toe', 'toeez', 'toeez@email.com', 'password222'),
('Cow', 'coweez', 'coweez@email.com', 'password333');

DROP TABLE IF EXISTS posts CASCADE;

CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  timestamp timestamp,
  user_id int,
  constraint fk_user foreign key(user_id) references users(id)
);

INSERT INTO posts ("message", "timestamp", "user_id") VALUES
('First', '1950-05-10 12:00:00', 1),
('Second', '1960-06-15 11:00:00', 2),
('Third', '1970-07-20 09:00:00', 3);