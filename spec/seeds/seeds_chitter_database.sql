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

-- Sequence and defined type

DROP TABLE IF EXISTS "public"."peeps" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  "content" text,
  "time" text,
  -- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id) references users(id)
);