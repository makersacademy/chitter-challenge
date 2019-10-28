CREATE TABLE users(user_id SERIAL PRIMARY KEY, name VARCHAR(40), username VARCHAR(40) UNIQUE, email VARCHAR(60) UNIQUE, password VARCHAR(20));
CREATE TABLE peeps(peep_id SERIAL PRIMARY KEY, peep_text VARCHAR(140), peep_user_id INTEGER, upload_time TIME, FOREIGN KEY(peep_user_id) REFERENCES users(user_id));
