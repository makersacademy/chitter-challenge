# inside your database 'CREATE DATABASE chitter;'

CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(120), creation_datetime TIMESTAMP WITH TIME ZONE);