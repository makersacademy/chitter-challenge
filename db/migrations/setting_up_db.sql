CREATE DATABASE chitter;

\c chitter

Create Users table

CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(60), message_id INT);
CREATE TABLE

Create Messages table

CREATE TABLE messages(id SERIAL PRIMARY KEY, content VARCHAR(60), time TIMESTAMP);
CREATE TABLE

Create security table

CREATE TABLE security(username VARCHAR(60), password VARCHAR(60));
CREATE TABLE

CREATE DATABASE chitter_test;
