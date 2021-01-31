CREATE TABLE peeps(id SERIAL PRIMARY KEY, date DATE, time TIME(0), message VARCHAR, sender VARCHAR);

CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR, password VARCHAR, email VARCHAR);
