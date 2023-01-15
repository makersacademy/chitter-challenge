TRUNCATE TABLE users, peeps RESTART IDENTITY;



INSERT INTO users (name, email, password) VALUES ('David', 'david@example.com', '1234');
INSERT INTO users (name, email, password) VALUES ('Anna', 'anna@email.co.uk', 'password');
INSERT INTO users (name, email, password) VALUES ('Mike', 'mike@mail.com', 'hg46d');
INSERT INTO users (name, email, password) VALUES ('Rob', 'rob@bob.uk', 'dk58as');

INSERT INTO peeps (message, date, user_id) VALUES ('It is raining today', '2022-08-08', '1' );
INSERT INTO peeps (message, date, user_id) VALUES ('Tonight we are going to take yoga classes', '2022-11-18', '2' );
INSERT INTO peeps (message, date, user_id) VALUES ('Nice day to go to the beach here in Brighton ', '2022-07-01', '1' );
INSERT INTO peeps (message, date, user_id) VALUES ('Christams is around the corner', '2022-12-20', '3' );
