TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users ("name", "username", "email", "password") VALUES
('Konrad', 'kdun', 'konrad@gmail.com', 'konrad'),
('Demi', 'demdawg', 'demi@aol.com', 'demigoddess'),
('Lalka', 'lalka', 'lalka@onlygoblins.com', 'goblin'),
('Jellybean', 'jelly', 'jelly@hotmail.com', 'feedme');