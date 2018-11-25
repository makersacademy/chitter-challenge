CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  date_added timestamp DEFAULT CURRENT_TIMESTAMP,
  content varchar(240)
);

ALTER TABLE users ADD COLUMN name VARCHAR(100);
