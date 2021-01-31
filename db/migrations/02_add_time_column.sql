ALTER TABLE messages ADD COLUMN date_time_stamp TIMESTAMP;
ALTER TABLE messages ALTER COLUMN date_time_stamp SET DEFAULT now();