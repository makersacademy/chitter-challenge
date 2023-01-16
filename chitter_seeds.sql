DROP TABLE IF EXISTS "public"."members";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS members_id_seq;

-- Table Definition
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name text,
    username text, 
    email text,
    password text
);

DROP TABLE IF EXISTS "public"."peeps";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  posted_at timestamp,
-- The foreign key name is always {other_table_singular}_id
  member_id int,
  constraint fk_member foreign key(member_id)
    references members(id)
    on delete cascade
);
