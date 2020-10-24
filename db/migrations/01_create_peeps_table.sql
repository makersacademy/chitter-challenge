CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(240), name VARCHAR(40), peeptime TIMESTAMP default current_timestamp);
