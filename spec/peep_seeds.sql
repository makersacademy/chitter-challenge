TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("message", "tag", "created_at") VALUES
('Nice weather this morning!', 'Miles', '2004-10-19 10:30'),
('Love this song!', 'Miles', '2001-01-14 08:45');