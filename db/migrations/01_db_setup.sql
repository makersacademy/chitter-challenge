CREATE DATABASE chitter;
CREATE DATABASE chitter_test;

\c chitter;
CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(100), password VARCHAR(32), handle VARCHAR(20));
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(140), time VARCHAR(60));
CREATE TABLE userspeeps (id SERIAL PRIMARY KEY, user_id INT, peep_id INT);

\c chitter_test;
CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(100), password VARCHAR(32), handle VARCHAR(20));
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(140), time VARCHAR(60));
CREATE TABLE userspeeps (id SERIAL PRIMARY KEY, user_id INT, peep_id INT);
