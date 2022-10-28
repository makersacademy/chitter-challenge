TRUNCATE TABLE messages RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO messages (content, time_date, user_id) VALUES ('My first Peep', '2022-10-26T13:42:38+01:00', 1);
INSERT INTO messages (content, time_date, user_id) VALUES ('This is MY first Peep', '2022-10-26T14:04:57+01:00', 2);