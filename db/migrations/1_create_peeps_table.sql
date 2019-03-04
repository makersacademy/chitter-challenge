CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  timestamp timestamptz NOT NULL,
  peep VARCHAR(140) NOT NULL
  );