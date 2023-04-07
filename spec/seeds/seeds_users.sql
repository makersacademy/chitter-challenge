TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (username, name, email, password) values('joebloggs123', 'Joe Bloggs', 'joebloggs@gmail.com', 'myweakpassword');
INSERT INTO users (username, name, email, password) values('johnsmith2000', 'John Smith', 'john.smith@gmail.com', '123456');
INSERT INTO users (username, name, email, password) values('chitter_guy', 'Dave Jones', 'dave.jones@gmail.com', 'mypass123');