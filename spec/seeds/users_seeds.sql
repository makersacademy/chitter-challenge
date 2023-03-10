DROP TABLE IF EXISTS users; 

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    email varchar,
    username varchar,
    password varchar
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("name", "email", "username", "password") VALUES
('Erykah Badu', 'erykah@gmail.com', 'BagLady', 'Baduizm99'),
('Lauryn Hill', 'lauryn@gmail.com', 'ExFactor', 'readyornot!'),
('Solange Knowles', 'solange@gmail.com', 'TheBetterSis', 'seat@thetable')
