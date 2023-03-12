TRUNCATE TABLE peeps RESTART IDENTITY;
TRUNCATE TABLE makers RESTART IDENTITY CASCADE; 



INSERT INTO makers ("email", "password", "name", "username") VALUES 
('maker1@mail.com', '12345678', 'maker1', 'username1'),
('maker2@mail.com', '12345678', 'maker2', 'username2');


INSERT INTO peeps ("content", "time", "maker_id") VALUES
( 'Content1', '2023-02-14 10:27:15','1'),
( 'Content2', '2023-02-14 11:27:15','2'),
( 'Content3', '2023-02-15 12:27:15','1');



