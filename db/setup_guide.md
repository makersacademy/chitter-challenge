to set up the database you will need PSQL and POSTGRESQL installed - this is assumed, if you do not have them installed then please do so prior to following these instructions:

launch psql:

psql 

create the chitter and chitter_test databases:

CREATE DATABASE chitter
CREATE DATABASE chitter_test

create the user tables in both databases:
\c #database
CREATE TABLE users(
chitter(# id serial PRIMARY KEY,
chitter(# username VARCHAR(50) UNIQUE NOT NULL,
chitter(# password VARCHAR(50) NOT NULL,
chitter(# email VARCHAR(3555) UNIQUE NOT NULL
chitter(# );