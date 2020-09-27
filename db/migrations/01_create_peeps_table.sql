# inside your database 'CREATE DATABASE chitter;'

CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(120), author_id INT, created_at TIMESTAMP);