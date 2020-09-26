CREATE TABLE chitter_users(id SERIAL PRIMARY KEY, username VARCHAR(15), password VARCHAR(20));
CREATE TABLE peeps(username VARCHAR(15), peep VARCHAR(120), time DATE);