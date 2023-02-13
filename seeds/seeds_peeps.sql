TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (message, time, user_id) VALUES ('message1', '2022-01-10 01:01:01', 1);
INSERT INTO peeps (message, time, user_id) VALUES ('message2', '2022-02-20 02:01:01', 2);
INSERT INTO peeps (message, time, user_id) VALUES ('message3', '2022-03-30 03:01:01', 2);