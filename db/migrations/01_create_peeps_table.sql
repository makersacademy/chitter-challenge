CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60), name VARCHAR(60), username VARCHAR(60));

INSERT INTO peeps (peep,name,username) VALUES ('peep 1', 'bob', 'bobthebuilder123');
INSERT INTO peeps (peep,name,username) VALUES ('another peep', 'adam', '3gg');
INSERT INTO peeps (peep,name,username) VALUES ('last peep for now', 'sara', 'sarah123');

ALTER TABLE peeps ADD COLUMN timestamp TIMESTAMP;

