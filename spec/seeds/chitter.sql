DROP TABLE IF EXISTS "public"."makers";

CREATE SEQUENCE IF NOT EXISTS makers_id_seq;

CREATE TABLE "public"."makers" (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

DROP TABLE IF EXISTS "public"."peeps";

CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

CREATE TABLE "public"."peeps" (
  id SERIAL PRIMARY KEY,
  timestamp text,
  content text,
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);

INSERT INTO "public"."makers" ("email", "password", "name", "username") VALUES
('lovestotest@testing.com', 'password', 'Testy McTestface', 'TSTR'),
('secondtester@makers.com', '123456', 'Obvious Plant', 'hello_world'),
('thirdguy@fakeemail.edu', 'swordfish', 'Bobby Tables', 'unique3');

INSERT INTO "public"."peeps" ("timestamp", "content", "maker_id") VALUES
('2022-10-09 22:31:54.554154 UTC', 'first test peep - bottom', 1),
('2022-10-09 22:31:55.554154 UTC', 'second test peep - up 1', 1),
('2022-10-09 22:31:56.554154 UTC', 'bobs 1st test peep', 2),
('2022-10-09 22:31:57.554154 UTC', 'bobs 2nd test peep', 2),
('2022-10-09 22:31:58.554154 UTC', 'back once again with the renegade master', 1),
('2022-10-09 22:31:59.554154 UTC', 'a new challenger appears', 3);



