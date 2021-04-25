CREATE TABLE peeps(id SERIAL PRIMARY KEY, url VARCHAR(280));
ALTER TABLE "peeps" ADD COLUMN "user_id" varchar(60);
ALTER TABLE "peeps" ADD COLUMN "time_stamp" varchar(60);