DROP TABLE IF EXISTS makers CASCADE; 

-- Table Definition
CREATE TABLE makers(
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    email text,
    password text,
    login_status text
);

TRUNCATE TABLE makers RESTART IDENTITY;

INSERT INTO makers ("name", "username", "email", "password") VALUES
('Chris', 'cast', 'cast@email.com', '123'),
('Forest', 'HandsomeForest', 'handsomeforest@caninemail.com', 'chicken123');