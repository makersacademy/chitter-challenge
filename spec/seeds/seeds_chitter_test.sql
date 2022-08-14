TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users ("name", "email_address", "password", "username") VALUES
('Sophie', 'sl@aol.com', 'abc123', 'SL'),
('Mabon', 'mg@aol.com', 'def456', 'MG');

INSERT INTO peeps ("content", "date_time", "user_id") VALUES
('Hello', '2022-06-08 12:00:00', 1),
('It is sunny today', '2022-08-03 11:00:00', 1),
('What is everyone doing today?', '2022-07-17 13:00:00', 2);
