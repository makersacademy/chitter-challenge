CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  timestamp timestamptz NOT NULL DEFAULT now(),
  peep VARCHAR(140) NOT NULL
  );