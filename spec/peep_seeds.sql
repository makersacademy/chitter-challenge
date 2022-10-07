TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("message", "tag", "time", "user_id") VALUES
('Nice weather this morning!', 'Miles', '2004-10-19 10:30', 1),
('Love this song!', 'Miles', '2001-01-14 08:45', 1);