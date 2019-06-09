connection.exec('CREATE DATABASE chitter;')

connection = PG.connect :dbname => 'chitter';
connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, author VARCHAR(20), handle VARCHAR(20), content NCHAR(140), date DATE, time TIME);')