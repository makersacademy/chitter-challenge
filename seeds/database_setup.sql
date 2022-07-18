CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY, email TEXT, username TEXT, password TEXT);
CREATE TABLE IF NOT EXISTS posts (id SERIAL PRIMARY KEY, post_date DATE, title TEXT, content TEXT, user_id int4, CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id));
