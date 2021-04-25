CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR(280))
ALTER TABLE "peeps" ADD COLUMN "user_id" varchar(60);
ALTER TABLE "peeps" ADD COLUMN "time_stamp" varchar(60);