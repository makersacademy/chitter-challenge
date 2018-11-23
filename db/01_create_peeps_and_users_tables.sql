CREATE TABLE peeps_test (peep_id SERIAL PRIMARY KEY, user_id INTEGER, timestamp TIMESTAMP, content VARCHAR (140));

CREATE TABLE users_test (user_id SERIAL PRIMARY KEY, user_name VARCHAR (60), email VARCHAR (60), password VARCHAR (60));
