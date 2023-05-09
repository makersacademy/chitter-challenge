TRUNCATE TABLE peeps RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (content, time, user_id) VALUES ('My very first peep!', '2023-05-05 19:10:25', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('This is better than twitter', '2023-05-09 09:55:01', '2');