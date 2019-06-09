connection = PG.connect :dbname => 'chitter';
connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, author VARCHAR(20), handle VARCHAR(20)), email VARCHAR(60), password VARCHAR(140);')