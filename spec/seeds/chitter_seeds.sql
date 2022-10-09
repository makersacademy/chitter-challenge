DROP TABLE IF EXISTS "public"."peeps";

CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE "public"."peeps" (
    "id" SERIAL,
    message text,
    time_stamp time,
    user_id int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" SERIAL,
    "name" text,
    "username" text,
    "email_address" varchar, 
    "password" char(20)
);

INSERT INTO "public"."peeps" ("message", "time_stamp", "user_id") VALUES
('Message_1', '10:10:10', 1),
('Message_2', '11:11:11', 1),
('Message_3', '12:12:12', 2),
('Message_4', '9:9:9', 3),
('Message_5', '8:8:8', 4);

INSERT INTO "public"."users" ("name", "username", "email_address", "password") VALUES
('Jack', 'Jack_user', 'Jacks_email', 'Jack_password'),
('Rosa', 'Rosa_user', 'Rosa_email', 'Rosa_password'),
('Timothy', 'Timothy_user', 'Timothy_email', 'Timothy_password'),
('Kyle', 'Kyle_user', 'Kyle_email', 'Kyle_password'),
('Kate', 'Kate_user', 'Kate_email', 'Kate_password');

