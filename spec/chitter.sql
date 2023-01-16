-- -------------------------------------------------------------
-- TablePlus 5.1.2(472)
--
-- https://tableplus.com/
--
-- Database: chitter
-- Generation Time: 2023-01-15 21:19:05.5730
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."peeps";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE "public"."peeps" (
    "id" int4 NOT NULL DEFAULT nextval('peeps_id_seq'::regclass),
    "peep_content" text,
    "time_posted" timestamp,
    "user_id" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "username" text,
    "password" text,
    "user_email" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."peeps" ("id", "peep_content", "time_posted", "user_id") VALUES
(1, 'Using Chitter for the first time!', '2023-01-15 17:30:56', 2),
(2, 'Have a great weekend!', '2023-01-15 17:35:10', 2),
(3, 'Weekend challenge!', '2023-01-15 17:40:50', 2),
(4, 'Hello Chitter!', '2023-01-15 17:53:31', 3),
(5, 'My first peep!', '2023-01-15 17:58:58', 1),
(6, 'Bad hair day :(', '2023-01-15 18:12:10', 3),
(7, 'Repeeps mean nugget treats.', '2023-01-15 19:33:30', 3),
(8, 'Just setting up my Chitter.', '2023-01-15 20:16:24', 4),
(9, 'Hello Chitterers!', '2023-01-15 20:59:26', 4);

INSERT INTO "public"."users" ("id", "username", "password", "user_email") VALUES
(1, 'Roger', 'blueskie5', 'roger@yahoo.com'),
(2, 'Oana', 'password1!', 'oana@gmail.com'),
(3, 'Matthew', '!@£QWELCOME', 'matt@hotmail.com'),
(4, 'Irene', 'yellow', 'irene@outlook.com');

-- ALTER TABLE "public"."peeps" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;
