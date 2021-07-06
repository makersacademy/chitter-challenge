to set up the database you will need PSQL and POSTGRESQL installed - this is assumed, if you do not have them installed then please do so prior to following these instructions:

launch psql:

psql 

create the chitter and chitter_test databases:

CREATE DATABASE chitter
CREATE DATABASE chitter_test

create the users table in both databases:

\c #database
CREATE TABLE users(
id serial PRIMARY KEY,
username VARCHAR(50) UNIQUE NOT NULL,
password VARCHAR(50) NOT NULL,
email VARCHAR(3555) UNIQUE NOT NULL
);

next create the peeps table in both databases:

\c #database
CREATE TABLE peeps(
id serial PRIMARY KEY,
text VARCHAR(280) NOT NULL,
time TIMESTAMP NOT NULL,
user_id INTEGER REFERENCES users(id)
);

CREATE TABLE tags(
 id serial PRIMARY KEY,
 user_id INTEGER REFERENCES users(id),
 peep_id INTEGER REFERENCES peeps(id)
  );