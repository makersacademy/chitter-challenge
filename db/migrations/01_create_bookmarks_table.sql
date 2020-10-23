CREATE DATABASE chitter
CREATE TABLE all_users(id SERIAL PRIMARY KEY, email VARCHAR(40), password VARCHAR(25), name VARCHAR(15), username VARCHAR(20));
CREATE TABLE all_peeps(id SERIAL PRIMARY KEY, peep_text VARCHAR(100), date DATE, time TIMESTAMP, user_id INTEGER REFERENCES all_users (id));

CREATE DATABASE chitter_test
CREATE TABLE all_users(id SERIAL PRIMARY KEY, email VARCHAR(40), password VARCHAR(25), name VARCHAR(15), username VARCHAR(20));
CREATE TABLE all_peeps(id SERIAL PRIMARY KEY, peep_text VARCHAR(100), date DATE, time TIMESTAMP, user_id INTEGER REFERENCES all_users (id));
