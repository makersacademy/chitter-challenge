psql
CREATE DATABASE "chitter_db";
CREATE TABLE users_db(id SERIAL PRIMARY KEY, name VARCHAR(15), email VARCHAR(50), password VARCHAR(12));
CREATE TABLE peeps_db(id SERIAL PRIMARY KEY, time integer, peep VARCHAR(140), user_id integer);

CREATE DATABASE "chitter_db_test";
CREATE TABLE users_db(id SERIAL PRIMARY KEY, name VARCHAR(15), email VARCHAR(50), password VARCHAR(12));
CREATE TABLE peeps_db(id SERIAL PRIMARY KEY, time integer, peep VARCHAR(140), user_id integer);

