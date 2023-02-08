TRUNCATE TABLE users,posts,comments RESTART IDENTITY;

INSERT INTO users (email,password,name,username) VALUES 
('abc@gmail.com','123','Luke','luke'),
('efg@gmail.com','456','Ryan','ryan'),
('ijk@gmail.com','789','Jenny','jenny');

INSERT INTO posts (content, ts, user_id) VALUES
('First content','2023-02-08 15:22:10',1),
('Second content','2023-02-08 15:22:10',1),
('Thrid content','2023-02-08 15:22:10',2);

INSERT INTO comments (content,ts,user_id,post_id) VALUES
('First comment','2023-02-08 15:22:10',2,1),
('Second comment','2023-02-08 15:22:10',3,1);
