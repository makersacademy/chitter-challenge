
DROP TABLE IF EXISTS "public"."users";

CREATE SEQUENCE IF NOT EXISTS users_id_seq;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

DROP TABLE IF EXISTS "public"."peeps";

CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  username text,
  content text,
  datetime timestamp without time zone
);

DROP TABLE IF EXISTS "public"."replies";

CREATE SEQUENCE IF NOT EXISTS replies_id_seq;

CREATE TABLE replies (
  id SERIAL PRIMARY KEY,
  username text,
  content text,
  datetime timestamp without time zone,
  peep_id int,
  constraint fk_item foreign key(peep_id)
    references peeps(id)
    on delete cascade
);
