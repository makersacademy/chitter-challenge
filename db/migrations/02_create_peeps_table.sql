CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content VARCHAR(280),
  timestamp timestamp DEFAULT to_timestamp(to_char(current_timestamp, 'YYYY-MM-DD HH24:MI'), 'YYYY-MM-DD HH24:MI'));
