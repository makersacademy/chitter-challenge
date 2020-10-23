CREATE DATABASE chitter
CREATE TABLE chitter_users(username VARCHAR(15), password TEXT);
CREATE TABLE peeps(username VARCHAR(15), peep VARCHAR(120), time DATE);
CREATE EXTENSION pgcrypt; 
You must also complete the same steps for a second database called chitter_test