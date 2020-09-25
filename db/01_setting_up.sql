CREATE TABLE users(id SERIAL PRIMARY KEY, user_name VARCHAR(12));
CREATE TABLE peeps(user_number INTEGER, peep VARCHAR(120), time DATE);