CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(300), created_at TIMESTAMP, user_id INT, FOREIGN KEY(user_id) REFERENCES users(id));
