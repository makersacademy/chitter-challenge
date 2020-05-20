CREATE TABLE users (
first_name VARCHAR(20),
last_name VARCHAR(30),
email VARCHAR(30), 
username VARCHAR(20),
password VARCHAR(20),
PRIMARY KEY (username));

CREATE TABLE peeps (
id SERIAL PRIMARY KEY,
username VARCHAR(20),
peep VARCHAR(280),
created_on TIMESTAMP,
FOREIGN KEY (username) REFERENCES users(username));
