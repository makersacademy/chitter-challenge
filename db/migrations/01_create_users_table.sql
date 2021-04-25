CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60));
ALTER TABLE "peeps" ADD COLUMN "user_id" varchar(60);
ALTER TABLE "peeps" ADD COLUMN "time_stamp" varchar(60);
