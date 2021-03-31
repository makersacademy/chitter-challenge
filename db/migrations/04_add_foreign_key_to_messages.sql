ALTER TABLE users 
RENAME COLUMN id TO user_id;

ALTER TABLE users 
RENAME COLUMN user_id TO id;

DROP TABLE messages;

CREATE TABLE messages(id SERIAL PRIMARY KEY, message VARCHAR(300), date_time_stamp TIMESTAMP, user_id INTEGER REFERENCES users(id));

ALTER TABLE messages ALTER COLUMN date_time_stamp SET DEFAULT now();

DROP TABLE messages;

CREATE TABLE messages(id SERIAL PRIMARY KEY, message VARCHAR(300), date_time_stamp TIMESTAMP, user_id INTEGER REFERENCES users(id), user_email VARCHAR(60));

ALTER TABLE messages ALTER COLUMN date_time_stamp SET DEFAULT now();

