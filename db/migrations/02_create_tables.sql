CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(30), password VARCHAR(100));
CREATE TABLE peeps (id SERIAL PRIMARY KEY, time_stamp TIMESTAMP, user_id INTEGER, peep VARCHAR(280));