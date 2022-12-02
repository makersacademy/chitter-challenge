DROP TABLE IF EXISTS peeps; 


TRUNCATE TABLE users RESTART IDENTITY;
-- ALTER SEQUENCE [user_id_seq] RESTART WITH 1;

INSERT INTO users (email_address, password) VALUES ('callum@gmail.com', 'God0fwar!');
INSERT INTO users (email_address, password) VALUES ('cecily@gmail.com', 'AnimalCr0ssing?');