CREATE DATABASE chitter;

CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(60), peep VARCHAR(140));

ALTER TABLE peeps ADD lastmodified TIMESTAMP 
        DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP;

UPDATE peeps
    SET lastmodified=CURRENT_TIMESTAMP;

ALTER TABLE peeps 
    ADD lastmodified TIMESTAMP;
 
ALTER TABLE peeps 
    ALTER COLUMN lastmodified 
        SET DEFAULT CURRENT_TIMESTAMP;
 
UPDATE peeps
    SET lastmodified=CURRENT_TIMESTAMP;
 
CREATE OR REPLACE FUNCTION update_lastmodified_column()
        RETURNS TRIGGER AS '
  BEGIN
    NEW.lastmodified = NOW();
    RETURN NEW;
  END;
' LANGUAGE 'plpgsql';
 
CREATE TRIGGER update_lastmodified_modtime BEFORE UPDATE
  ON peeps FOR EACH ROW EXECUTE PROCEDURE
  update_lastmodified_column();