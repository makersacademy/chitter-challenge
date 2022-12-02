TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email, password, name, username) VALUES
-- PASSWORD: password
('thomas@email.com', '$2a$12$1CrGiZefwfjMBHXzRwf.ROQtx1lt.vaXwbgAl1fQEJYXwVVwEY9LO', 'Thomas Seleiro', 'TSeleiro'),
-- PASSWORD: P@$$w0rd
('graeme@email.com', '$2a$12$fALqEuM793QuKQfp3x3H2e9B.5yM3ftUqGoBKk1a2bV3mt2fwoxri', 'Graeme Paterson', 'GPaterson'),
-- PASSWORD: '1234hello1234'
('robbie@email.com', '$2a$12$cHmw7YQKvYh/Fy/k37YUZuldl.b5Y3.cNpojS8Kn1yjmmE8y1trVa', 'Robbie Kirkbride', 'RKirkbride');

INSERT INTO peeps(contents, time_posted, account_id) VALUES
('My first peep', '2022-11-01 16:00:00', 1),
('My second peep', '2022-11-01 16:00:30', 1),
('Hello', '2022-11-02 09:30:14', 2),
('Test', '2022-11-02 16:00:30', 3),
('My third peep', '2022-11-03 07:13:49', 1);
