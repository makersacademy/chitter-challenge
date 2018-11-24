CREATE TABLE users("username" VARCHAR(15)PRIMARY KEY,
                   "password" VARCHAR(60),
                   "forename" VARCHAR(35),
                   "surname" VARCHAR(35),
                   "e-mail" VARCHAR(320) UNIQUE
                 );
