CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(140), peep_time timestamptz DEFAULT NOW(), poster VARCHAR(60));
