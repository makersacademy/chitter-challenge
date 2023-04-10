TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (name, email, username, password) VALUES ('John Doe', 'john_d@email.com', 'j0ndoe', 'pas5w0rd!');
INSERT INTO users (name, email, username, password) VALUES ('Jane Doe', 'jane_d@email.com', 'jane_d0e', 'pa5sw0rd');

INSERT INTO peeps (message, time, user_id) VALUES ('peep 1', '2023-04-09 19:10:00', 1);
INSERT INTO peeps (message, time, user_id) VALUES ('peep peep 2', '2023-04-09 19:05:00', 1);
INSERT INTO peeps (message, time, user_id) VALUES ('new peep!', '2023-04-10 15:12:00', 2);