DROP TABLE IF EXISTS "public"."peeps";
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;
DROP TABLE IF EXISTS "public"."users";
CREATE SEQUENCE IF NOT EXISTS users_id_seq;



CREATE TABLE "public"."users"(
  id SERIAL,
  username text,
  password text,
  PRIMARY KEY ("id")
);

CREATE TABLE "public"."peeps"(
  id SERIAL PRIMARY KEY,
  content text,
  author_id int,
  time_posted timestamp ,
  constraint fk_users foreign key(author_id) references users(id)
);

INSERT INTO "public"."users"("username", "password") VALUES
('Joe', '123'),
('Joseph', 'Thisismypassword');


INSERT INTO "public"."peeps"("content","author_id","time_posted") VALUES
('This is post num 1', 1, '2020-05-12 14:13:30'),
('This is second post', 2,'2022-07-16 15:13:00');
