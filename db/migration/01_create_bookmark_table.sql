CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60));
INSERT INTO peeps (peep, created_at) VALUES ('Kikoo', '14:00:00');
INSERT INTO peeps (peep) VALUES ('Kikoo');
DELETE FROM peeps WHERE peep = 'Kikoo';
ALTER TABLE peeps ADD COLUMN created_at TIMESTAMPTZ;
ALTER TABLE peeps ALTER COLUMN created_at SET DEFAULT current_timestamp;
ALTER TABLE peeps DROP COLUMN created_at;