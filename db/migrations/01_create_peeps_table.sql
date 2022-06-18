-- AUTOMATIC timestamps with PostgreSQL

-- For chitter_chatter

-- step 1: Create the function 
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- step 2: Create the Table

CREATE TABLE peeps (
  id SERIAL NOT NULL PRIMARY KEY,
  content TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

-- step 3: Create the Trigger

CREATE TRIGGER set_timestamp
BEFORE UPDATE ON todos
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

-- step 4: same thing for chitter_chatter_test