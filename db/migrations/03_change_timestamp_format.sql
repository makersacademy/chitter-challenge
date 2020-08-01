INSERT INTO peeps (text, timestamp) VALUES ('Test2', current_timestamp);
SELECT text, to_char(timestamp, 'yyyymmdd hh:mi') as timestamp_round from peeps;