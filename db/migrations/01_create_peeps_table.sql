CREATE DATABASE "chitter_manager";
\c chitter_manager
CREATE TABLE peeps(id SERIAL PRIMARY KEY, message_content VARCHAR(120));