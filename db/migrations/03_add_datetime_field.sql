ALTER TABLE peeps ADD COLUMN date_time_created TIMESTAMP;
ALTER TABLE peeps ALTER COLUMN date_time_created SET DEFAULT now();