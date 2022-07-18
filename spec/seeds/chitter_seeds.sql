-- Table without foreign key
DROP TABLE IF EXISTS "public"."users" CASCADE;
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

CREATE TABLE "public"."users" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "username" text,
  "email" text,
  "password" text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO "public"."users" ("name", "username", "email", "password") VALUES
('name1', 'username1', 'test1@email.com', '123'),
('name2', 'username2', 'test2@email.com', '000000'),
('name3', 'username3', 'test3@email.com', 'password1');

-- Table with foreign key
DROP TABLE IF EXISTS peeps CASCADE;
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

CREATE TABLE peeps (
  "id" SERIAL PRIMARY KEY,
  "content" text,
  "date" timestamp,
  "user_id" int,
  constraint "fk_user" foreign key("user_id") references "users"("id")
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("content", "date", "user_id") VALUES
('content1', '2020-10-10 10:10:10', 1),
('content2', '2021-12-22 12:12:12', 1),
('content3', '2022-07-10 09:09:09', 2);

-- timestamp format: 'YYYY-MM-DD HH:MI:SS'