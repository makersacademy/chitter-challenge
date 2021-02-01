CREATE TABLE users(user_id SERIAL PRIMARY KEY, username VARCHAR(15) NOT NULL, email VARCHAR(20) NOT NULL, password VARCHAR(100));
CREATE TABLE posts(post_id SERIAL PRIMARY KEY, user_id INT, body VARCHAR(1000) NOT NULL, timestamp timestamp default current_timestamp);
