1.

CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

2.

CREATE TABLE peeps (
  id SERIAL NOT NULL PRIMARY KEY,
  peep TEXT,
  posted TIMESTAMPTZ NOT NULL DEFAULT NOW()
  );

3. 

CREATE TRIGGER set_timestamp
BEFORE UPDATE ON peeps
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

