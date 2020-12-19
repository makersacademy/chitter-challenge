ALTER TABLE peeps ADD COLUMN date_time_stamp TIMESTAMP;
ALTER TABLE peeps ALTER COLUMN date_time_stamp SET DEFAULT now();
