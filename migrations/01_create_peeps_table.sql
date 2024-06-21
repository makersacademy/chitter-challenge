# in migrations/01_create_peeps_table.sql
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR (280), date_posted TIMESTAMP NOT NULL);
ALTER TABLE peeps ADD COLUMN title(60);
