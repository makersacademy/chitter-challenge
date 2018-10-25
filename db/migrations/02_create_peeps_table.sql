CREATE TABLE peeps (
  peep_id SERIAL PRIMARY KEY,
  peep_time TIMESTAMP,
  username VARCHAR(20),
  content VARCHAR(200)
);
