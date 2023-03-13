DROP TABLE IF EXISTS "public"."posts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

-- Table Definition
CREATE TABLE "public"."posts" (
    "id" SERIAL,
    "message" text,
    "datetime" timestamp,
    "user_id" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" SERIAL,
    "username" text,
    "password" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."users" ("username", "password") VALUES
('SuperHans','$2a$12$7Bpme/Bdgwoi0BPZeDJcXOCvS7NrZy3PXZotXkFtFEge9k2Y0mCfa'),
('Dobby','$2a$12$jpoLZYPCL6tjCsIWGU3/8ePa3qz7nSMRvi8ZtsrFcWUb8SnmtbhsO'),
('BigSuze','$2a$12$HpqA97QwAc0/tDy.8kWJW.raDkiM.nOQa0Awd2iK36A9eA0X0GFXi'),
('AlanJ','$2a$12$cW5vkkZ/jhOmUbPzckHNDOdW4KVccnIfLx7qKStntLIDoPeRjD7li'),
('Jez','$2a$12$p.Y/6iCFDysMR6BquOIkDuopbb0/VkXyKk2YlT2Ihf5OiVH5zz.pW'),
('MarkyMark','$2a$12$FlTl0ei1YTDqOWhHgfuXeeLmY2oQzRoNbFA28iecvQWHOOUoxw1ce');

INSERT INTO "public"."posts" ("message", "datetime", "user_id") VALUES
('Whoa, whoa Kenny! What are you doing?', '1999-01-08 04:05:06 +1:00', 1),
('Shotguns? What, like guns that fire shot?', '2022-10-18 04:05:06 -8:00', 2),
('Yeah. You must be Harry. Sorry, didnt know your father.', '2000-01-08 04:05:06 +02:00', 1),
('Will you two stop flirting for a minute?', '1949-11-08 04:05:06 -8:00', 4);
