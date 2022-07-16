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
('name 1', 'username_1', 'test1@email.com', 'password123'),
('name 2', 'username_2', 'test2@email.com', 'password234'),
('name 3', 'username_3', 'test3@email.com', 'password345');

-------------------------------------------------------------------------------

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
('message 1', '2022-07-15 10:23:54', 1),
('massage 2', '2022-07-15 10:24:54', 2),
('message 3', '2022-07-16 10:25:54', 3),
('message 4', '2022-07-16 10:26:54', 2);