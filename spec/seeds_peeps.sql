TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps
  (content, time_posted, user_id)
  VALUES
    ('content_1', '2023-05-01 17:15:32', 1),
    ('content_2', '2022-04-21 04:03:02', 2),
    ('content_3', '2022-06-21 00:01:02', 3),
    ('content_4', '2022-06-21 22:01:02', 4),
    ('content_5', '1999-04-19 16:59:59', 1),
    ('content_6', '2005-12-27 03:45:06', 1),
    ('content_7', '2007-08-13 17:17:17', 4)
;