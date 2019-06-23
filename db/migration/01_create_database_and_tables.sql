CREATE DATABASE chitter_db_test

CREATE TABLE chitter_db_test.peeps (id SERIAL PRIMARY KEY, user_id varchar, body varchar(260), timestamp timestamp CURRENT_TIMESTAMP);
CREATE TABLE chitter_db_tese.users (id SERIAL PRIMARY KEY, name varchar(60) email varchar(60) username varchar(60))