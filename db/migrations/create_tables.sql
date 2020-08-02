CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(60),
  "email_address" varchar(60),
  "password" varchar(140)
);

CREATE TABLE "peeps" (
  "id" SERIAL PRIMARY KEY,
  "content" varchar,
  "published" timestamp default (now() at time zone 'utc'),
  "edited" timestamp default (now() at time zone 'utc')
);

CREATE TABLE "user_peeps" (
  "id" SERIAL PRIMARY KEY,
  "thread_id" integer,
  "peep_id" integer,
  "user_id" integer
);

CREATE TABLE "threads" (
  "id" SERIAL PRIMARY KEY,
  "published" timestamp default (now() at time zone 'utc')
);

ALTER TABLE "user_peeps" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_peeps" ADD FOREIGN KEY ("peep_id") REFERENCES "peeps" ("id");

ALTER TABLE "user_peeps" ADD FOREIGN KEY ("thread_id") REFERENCES "threads" ("id");
