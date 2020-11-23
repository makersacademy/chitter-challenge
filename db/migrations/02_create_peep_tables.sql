CREATE TABLE peeps(id SERIAL PRIMARY KEY, chitter_id int NOT NULL REFERENCES chitter(id), content VARCHAR(240), date DATE, time TIME);
