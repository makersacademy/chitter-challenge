TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY;


INSERT INTO users (name, username, email, password) VALUES ('Tam', 'Tamy', 'tam@mail.com', '1234');
INSERT INTO users (name, username, email, password) VALUES ('Jam', 'JamyJ', 'jam@mail.com', '0000');

INSERT INTO peeps (content, date, user_id) VALUES ('Hello world', '2020-01-01 10:05:12', 1);
INSERT INTO peeps (content, date, user_id) VALUES ('Testing.. 1..2..3', '2022-01-01 10:12:19', 2);