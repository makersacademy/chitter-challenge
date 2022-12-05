
TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (message, time, user_id) VALUES ('Just got up', '2022-01-01 01:01:01', 1);
INSERT INTO peeps (message, time, user_id) VALUES ('Going out', '2022-02-02 02:02:02', 2);
INSERT INTO peeps (message, time, user_id) VALUES ('Wanna sleep', '2022-03-03 03:03:03', 2);