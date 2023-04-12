TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users ("name", "username", "email", "password") VALUES
('Alice Smith', 'malice12', 'alice.smith@gmail.com', 'password'),
('Bobby Blake', 'mrbobby', 'mrbobby@gmail.com', 'secret');

INSERT INTO peeps ("time", "content", "user_id") VALUES
('2023-03-20 12:22:00', 'This is my first peep!', '1'),
('2023-04-01 10:19:00', 'Hello Chitter.', '2');
