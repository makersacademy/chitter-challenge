TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (username, name, email, password) values('joebloggs123', 'Joe Bloggs', 'joebloggs@gmail.com', '$2a$12$LO.0xwjovoGUVJTubcCOl.W10MkezxwOTfIS6yKRq8qCRS8iMwHZq');
INSERT INTO users (username, name, email, password) values('johnsmith2000', 'John Smith', 'john.smith@gmail.com', '$2a$12$LO.0xwjovoGUVJTubcCOl.W10MkezxwOTfIS6yKRq8qCRS8iMwHZq');
INSERT INTO users (username, name, email, password) values('chitter_guy', 'Dave Jones', 'dave.jones@gmail.com', '$2a$12$LO.0xwjovoGUVJTubcCOl.W10MkezxwOTfIS6yKRq8qCRS8iMwHZq');