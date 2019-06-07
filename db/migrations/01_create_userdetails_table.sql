CREATE TABLE userdetails(id SERIAL PRIMARY KEY, name VARCHAR(60), user_name VARCHAR(30), email VARCHAR);
CREATE TABLE peeps(peeps_id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES userdetails(id), peeps VARCHAR(100), date DATE);
