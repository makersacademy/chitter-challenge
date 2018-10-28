ALTER TABLE peeps ADD COLUMN date timestamp;
UPDATE peeps SET date = to_timestamp(time, 'yy-mm-dd hh24:mi');
ALTER TABLE peeps DROP time;