TRUNCATE TABLE users,posts,comments RESTART IDENTITY;

INSERT INTO users (email,password,name,username) VALUES 
('abc@gmail.com','123','Luke','luke'),
('efg@gmail.com','456','Ryan','ryan'),
('ijk@gmail.com','789','Jenny','jenny');

INSERT INTO posts (content, ts, user_id) VALUES
('First content',current_timestamp,1),
('Second content',current_timestamp,1),
('Thrid content',current_timestamp,2);

INSERT INTO comments (content,ts,user_id,post_id) VALUES
('First comment',current_timestamp,2,1),
('Second comment',current_timestamp,3,1);
