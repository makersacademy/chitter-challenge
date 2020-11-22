CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(280), peep_time timestamptz DEFAULT NOW());
