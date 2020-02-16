-- db name: chitter and chitter_test
CREATE TABLE users(id SERIAL PRIMARY KEY, user_name VARCHAR(30), password VARCHAR(30)); 
CREATE TABLE peeps(id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), peep VARCHAR(140), ts TIMESTAMP);
-- check date/time later smalldatetime?