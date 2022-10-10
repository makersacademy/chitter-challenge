-- -------------------------------------------------------------
-- TablePlus 4.5.0(396)
--
-- https://tableplus.com/
--
-- Database: design
-- Generation Time: 2022-04-27 17:13:27.2140
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."peeps";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE "public"."peeps" (
    "id" SERIAL,
    message text,
    time_stamp timestamp,
    user_id int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email varchar,
  password text
);


INSERT INTO peeps ("message", "time_stamp", "user_id") VALUES
('message1', '2022-06-08 12:00:00', 1),
('message2', '2022-09-07 13:00:00', 1),
('message3', '2022-08-06 15:00:00', 2),
('message4', '2022-10-08 13:48:00', 3),
('message5', '2022-10-08 14:17:00' , 4);

INSERT INTO users ("name", "username", "email", "password") VALUES
('Hibaq', 'Hibaq123', 'hibaq@gmail.com','potatolife'),
('Anna', 'Anna123', 'Anna@gmail.com','Userlife123'),
('James', 'James123', 'Zara@gmail.com','Welcometo'),
('Mary', 'Mary123', 'David@gmail.com','New_password'),
('Alan', 'Alan123', 'Jerry@gmail.com','Rhianna');