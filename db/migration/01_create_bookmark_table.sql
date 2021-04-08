CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60));
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
INSERT INTO peeps (peep, created_at) VALUES ('Kikoo', '14:00:00');
INSERT INTO peeps (peep) VALUES ('Kikoo');
DELETE FROM peeps WHERE peep = 'Kikoo';
ALTER TABLE peeps ADD COLUMN created_at TIMESTAMPTZ;
ALTER TABLE peeps ALTER COLUMN created_at SET DEFAULT current_timestamp;
ALTER TABLE peeps DROP COLUMN created_at;
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), peep_id INTEGER REFERENCES peeps (id));