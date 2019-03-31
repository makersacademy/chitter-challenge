CREATE TABLE "peeps" (
    "id" serial PRIMARY KEY,
    "datetime" timestamp NOT NULL DEFAULT now(),
    "peep" text NOT NULL,
    "id_user" INT NOT NULL,
    "name" varchar(50) NOT NULL
);

CREATE TABLE "user" (
    "id" serial PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "username" varchar(50) NOT NULL,
    "e-mail" varchar(100) NOT NULL,
    "password" varchar(50) NOT NULL
);