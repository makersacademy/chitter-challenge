CREATE TABLE chitter(id SERIAL PRIMARY KEY, peep VARCHAR(140), lastmodified TIMESTAMP, username VARCHAR(60));
ALTER TABLE chitter ALTER COLUMN lastmodified SET DEFAULT CURRENT_TIMESTAMP;
UPDATE chitter SET lastmodified=CURRENT_TIMESTAMP;
CREATE OR REPLACE FUNCTION update_lastmodified_column()
        RETURNS TRIGGER AS '
  BEGIN
    NEW.lastmodified = NOW();
    RETURN NEW;
  END;
' LANGUAGE 'plpgsql';
CREATE TRIGGER update_lastmodified_modtime BEFORE UPDATE
  ON chitter FOR EACH ROW EXECUTE PROCEDURE
  update_lastmodified_column();