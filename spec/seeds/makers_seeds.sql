DROP TABLE IF EXISTS makers; 

-- Table Definition
CREATE TABLE makers(
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    email text,
    password text
);

TRUNCATE TABLE makers RESTART IDENTITY;

INSERT INTO makers ("name", "username", "email", "password") VALUES
('Chris', 'cast', 'cast@email.com', '123'),
('Forest', 'HandsomeForest', 'handsomeforest@caninemail.com', 'chicken123');