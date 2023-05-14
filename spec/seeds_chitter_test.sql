TRUNCATE TABLE peeps_users, users, peeps RESTART IDENTITY;

INSERT INTO users (email, password, name, username) VALUES ('hello@example.com', 'password', 'Bob', 'bob678'), 
('fred@example.com', '$2a$12$7NbikxOM4OU25bN0CT/lxevYcjDFnJzzReisBY6PUObEvmYEpy3hG', 'Fred', 'freddo');

INSERT INTO peeps (message, timestamp, user_id, peep_id) VALUES
('Hello world', '2023-04-28 12:45:05', 1, null),
('This is a great peep', '2023-05-03 16:23:34', 2, null),
('This is a reply to the great peep', '2023-05-04 11:01:25', 1, 2),
('I am tagging Bob', '2023-05-01 16:23:35', 2, null);

INSERT INTO peeps_users (peep_id, user_id) VALUES
(4, 1);