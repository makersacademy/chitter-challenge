CREATE TABLE peeps(peeps_id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES userdetails(id), peeps VARCHAR(100), datenow TIMESTAMP);
