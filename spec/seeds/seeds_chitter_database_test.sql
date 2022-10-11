-- TRUNCATE TABLE items RESTART IDENTITY CASCADE; 

DROP TABLE IF EXISTS "public"."users" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  "name" text,
  "username" text,
  "email" text,
  "password" text
);

-- TRUNCATE TABLE orders RESTART IDENTITY CASCADE; 
-- Sequence and defined type

DROP TABLE IF EXISTS "public"."peeps" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  "content" text,
  "time" timestamp,
  -- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id) references users(id)
);
-- TRUNCATE TABLE items_orders RESTART IDENTITY; 

INSERT INTO users (name, username, email, password) VALUES
('Anna', 'anna123', 'anna@makersacademy.com', '235346hgsdv'),
('John', 'john123', 'john123@makersacademy.com', 'ddff!@£!@$34tfsd'),
('Rachel', 'rachel123', 'notrachel@makersacademy.com', 'DR3tg3gwwdsvs');

INSERT INTO peeps (content, time, user_id) VALUES
('I love sunshine', '2004-10-19 10:23:54', 1),
('I do not love sunshine', '2005-10-19 12:23:54', 2),
('I like rain', '2006-10-19 23:23:54', 3),
('I am dancing in the rain', '2007-10-19 07:23:54', 1),
('I like dogs','2008-10-19 10:15:54', 1),
('I like cats', '2009-10-19 10:00:54', 2);