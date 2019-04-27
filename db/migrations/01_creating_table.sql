CREATE TABLE peep_table (
  id SERIAL PRIMARY KEY,
  peep VARCHAR(240) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);


INSERT INTO peep_table (peep)
VALUES ('It is cold today');