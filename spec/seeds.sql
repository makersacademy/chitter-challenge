-- Table without foreign key
DROP TABLE IF EXISTS "public"."users" CASCADE;
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

CREATE TABLE "public"."users" (
  "id" SERIAL PRIMARY KEY,
  name text,
  "username" text,
  "email" text,
  "password" text
);

INSERT INTO "public"."users" ("id", "username", "email", "password") VALUES
(1, 'test1@email.com', 'username1', "123456"),
(2, 'test2@email.com', 'username2', "000000"),
(3, 'test3@email.com', 'username3', "password");

-----------------------------------------
-- Table with foreign key
DROP TABLE IF EXISTS peeps CASCADE;
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

CREATE TABLE peeps (
  "id" SERIAL PRIMARY KEY,
  "content" text,
  "date" datetime,
  "user_id" int,
  constraint "fk_user" foreign key("user_id") references "users"("id")
);


INSERT INTO peeps ("id", "content", "date", "user_id") VALUES
(1, 'content1', 2020-10-10 10:10:10, 1),
(2, 'content2', 2020-12-12 12:12:12, 1),
(3, 'content3', 2020-19-10 09-09-09, 1);

-- datetime format: YYYY-MM-DD HH:MI:SS