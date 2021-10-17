CREATE TABLE users (user_id SERIAL PRIMARY KEY, username VARCHAR(20) NOT NULL UNIQUE, name VARCHAR (40) NOT NULL UNIQUE, email_address VARCHAR(255) NOT NULL UNIQUE, password VARCHAR(50) NOT NULL);

-- INSERT INTO users (username, name, email_address, password) VALUES ('test', 'test', 'test@gmail.com','password');