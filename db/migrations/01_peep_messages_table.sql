CREATE TABLE peep_messages (
  id SERIAL PRIMARY KEY,
  message VARCHAR(60),
  timestamp TIMESTAMPTZ default CURRENT_TIMESTAMP
);