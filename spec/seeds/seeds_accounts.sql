TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email, password, name, username) VALUES
('thomas@email.com', 'password', 'Thomas Seleiro', 'TSeleiro'),
('graeme@email.com', 'P@$$w0rd', 'Graeme Paterson', 'GPaterson'),
('robbie@email.com', '1234hello1234', 'Robbie Kirkbride', 'RKirkbride');

INSERT INTO peeps(contents, time_posted, account_id) VALUES
('My first peep', '2022-12-01 16:00:00', 1),
('My second peep', '2022-12-01 16:00:30', 1),
('Hello', '2022-12-02 09:30:14', 2),
('Test', '2022-12-02 16:00:30', 3),
('My third peep', '2022-12-03 07:13:49', 1);