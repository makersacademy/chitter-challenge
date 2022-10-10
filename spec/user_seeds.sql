TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("email", "password") VALUES
('name@email.com', 'Password1'),
('name_surname@email.com', 'password_2');