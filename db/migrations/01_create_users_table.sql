CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60))
ALTER TABLE "users" ADD COLUMN "email" varchar(60);
ALTER TABLE "users" ADD COLUMN "password" varchar(60);