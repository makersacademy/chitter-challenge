TRUNCATE TABLE users,posts,comments RESTART IDENTITY;

-- hashed_password_1 = BCrypt::Password.create("123")
-- hashed_password_2 = BCrypt::Password.create("456")
-- hashed_password_3 = BCrypt::Password.create("789")

INSERT INTO users (email,password,name,username) VALUES 
('abc@gmail.com','$2a$12$8x4FtYHQQWp8cV1Z1Bt/Ve.p7HDuHbJhlcyWCF7ZHPcslqUsSHTKC','Luke','luke'),
('efg@gmail.com','$2a$12$UvyvZGIQt92FVpzpVKQY7O9wYeKz5uHldxsCQWzEIjK9Tg2hqy8VC','Ryan','ryan'),
('ijk@gmail.com','$2a$12$AR8UUSIJ8FXp12XQQS5/ge/SYLifp8y8yxGfYHJK5ExXlSAsnhp5O','Jenny','jenny');

INSERT INTO posts (content, created_time, user_id) VALUES
('First content','2023-02-08 15:22:10',1),
('Second content','2023-02-08 18:22:10',1),
('Thrid content','2023-02-08 20:22:10',2);

INSERT INTO comments (content,created_time,user_id,post_id) VALUES
('First comment','2023-02-08 15:22:10',2,1),
('Second comment','2023-02-08 18:22:10',3,1);
