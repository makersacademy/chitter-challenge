CREATE TABLE peeps(id SERIAL PRIMARY KEY, creator text, message VARCHAR(280), time_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);