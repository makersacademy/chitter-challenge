
TRUNCATE TABLE users, peeps, replies RESTART IDENTITY;

INSERT INTO users ("name", "username", "email", "password") VALUES
('JC Morgan', 'JCMorgan', 'JCMfakeemail@email.com', '$2a$12$wBqMt0dl7z1Y8oznseeE/eXl9LrpE307w.YnpQ3ao5fr7NnvMUicW'),
('Steve Martin', 'CoolCat23', 'SteveMfakeemail@email.com', '$2a$12$Lum7gAhYRrbhyWz7Z3/ry.UbN1WykVXQ4Qfpp5tMBSNLmpkolvFc.');


INSERT INTO peeps ("username", "content", "datetime") VALUES
('JCMorgan', 'First Peep!', '2022-12-04 12:22:50'),
('CoolCat23', 'Hi!', '2022-12-04 13:01:32');


INSERT INTO replies ("username", "content", "datetime", "peep_id") VALUES
('JCMorgan', 'Hi', '2022-12-04 13:02:47', 2),
('CoolCat23', ':D', '2022-12-04 13:04:05', 2);

