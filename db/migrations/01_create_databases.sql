CREATE DATABASE chitter_prod;
\c chitter_prod;
CREATE TABLE "peeps" ("id" SERIAL PRIMARY KEY, "name" VARCHAR(60), "handle" VARCHAR(60), "peep_text" VARCHAR(120), "peep_time" VARCHAR(10));
CREATE DATABASE chitter_test;
\c chitter_test;
CREATE TABLE "peeps" ("id" SERIAL PRIMARY KEY, "name" VARCHAR(60), "handle" VARCHAR(60), "peep_text" VARCHAR(120), "peep_time" VARCHAR(10));