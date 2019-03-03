CREATE DATABASE chitter_prod;
\c chitter_prod;
CREATE TABLE "users" ("id" SERIAL PRIMARY KEY, "name" VARCHAR(60), "handle" VARCHAR(60), "created_at" TIMESTAMP);
CREATE TABLE "peeps" ("id" SERIAL PRIMARY KEY, "user_id" INTEGER REFERENCES users(id), "peep_text" VARCHAR(120), "created_at" TIMESTAMP);
CREATE DATABASE chitter_test;
\c chitter_test;
CREATE TABLE "users" ("id" SERIAL PRIMARY KEY, "name" VARCHAR(60), "handle" VARCHAR(60), "created_at" TIMESTAMP);
CREATE TABLE "peeps" ("id" SERIAL PRIMARY KEY, "user_id" INTEGER REFERENCES users(id), "peep_text" VARCHAR(120), "created_at" TIMESTAMP);
CREATE USER postgres WITH SUPERUSER;