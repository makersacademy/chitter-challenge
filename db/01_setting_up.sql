CREATE TABLE chitter_users(id SERIAL PRIMARY KEY, username VARCHAR(15), password VARCHAR(20));
CREATE TABLE peeps(user_number INTEGER, peep VARCHAR(120), time DATE);