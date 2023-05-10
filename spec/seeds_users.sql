TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (email, password, name, username) VALUES ('samm@makersacademy.com', 'password123', 'Sam Morgan', 'sjmog');
INSERT INTO users (email, password, name, username) VALUES ('dkong@makersacademy.com', 'banana123', 'Donkey Kong', 'dkong');