Production Database
$ psql
$ student=# CREATE DATABASE "chitter";
$ student=# \c chitter;
$ chitter=# CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140) NOT NULL, time VARCHAR(30) NOT NULL);

Test Database

$ psql
$ student=# CREATE DATABASE "chitter_test";
$ student=# \c chitter_test;
$ chitter=# CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140) NOT NULL, time VARCHAR(30) NOT NULL);
