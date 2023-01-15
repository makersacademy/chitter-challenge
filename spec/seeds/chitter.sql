-- -------------------------------------------------------------
-- TablePlus 5.1.2(472)
--
-- https://tableplus.com/
--
-- Database: chitter
-- Generation Time: 2023-01-15 14:58:06.0050
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."posts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

-- Table Definition
CREATE TABLE "public"."posts" (
    "id" SERIAL,
    "message" text,
    "time_created" timestamp,
    "user_id" int4,
    PRIMARY KEY ("id")
);


INSERT INTO posts ("message", "time_created") VALUES
('Just sold my soul to satan for 1 million dollars', CURRENT_TIMESTAMP),
('2.5 hours ago 2.5 hours ago 2.5 hours ago 2.5 hours ago 2.5 hours ago 2.', CURRENT_TIMESTAMP),
('my pc is dying and i’m LITERALLY IN BED HELP', CURRENT_TIMESTAMP);


DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" SERIAL,
    "name" text,
    "username" text NOT NULL,
    "email_address" text NOT NULL,
    "password" text NOT NULL,
    PRIMARY KEY ("id")
);


INSERT INTO users ("name", "username", "email_address", "password") VALUES
( 'Harry Potter', 'Hpotter', 'harrypotter@gmail.com', 'apple1'),
( 'Ron Weasley', 'RWeasley', 'ronweasley@gmail.com', 'banana2'),
( 'Hermione Granger', 'Hermione', 'hermionegranger@gmail.com', 'Orange3'),
( 'Draco Malfoy', 'Malfoy', 'malfoy@hotmail.com', 'kiwi4');


ALTER TABLE "public"."posts" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;
