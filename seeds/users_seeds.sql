DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (id SERIAL PRIMARY KEY, email TEXT, username TEXT, password TEXT);

TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (email, username, password) VALUES ('shaunhohoho@gmail.com', 'shaunho', '$2a$12$y3myb9cZLYhWSY5Q6/QQ0utvAElb42HReiijcYwXJy0T5HMKtv7c.'), ('shaunhohoho@gmail.com', 'hoshaun', '$2a$12$BwKTocix5nFuxjm8XKImYusVVUNp/CcsSORpizMgfQb8KtEdpA5eC');
