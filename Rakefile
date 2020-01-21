require 'pg'

task :setup do
  connection = PG.connect
  connection.exec('DROP DATABASE IF EXISTS chitter;')
  connection.exec('CREATE DATABASE chitter;')

  connection.exec('DROP DATABASE IF EXISTS chitter_test;')
  connection.exec('CREATE DATABASE chitter_test;')

  connection.exec('DROP DATABASE IF EXISTS chitter_users;')
  connection.exec('CREATE DATABASE chitter_users;')

  connection.exec('DROP DATABASE IF EXISTS chitter_users_test;')
  connection.exec('CREATE DATABASE chitter_users_test;')

  connection = PG.connect :dbname => 'chitter';
  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(280), created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);')
  connection.exec("INSERT INTO peeps (peep) VALUES ('test post');")

  connection = PG.connect :dbname => 'chitter_test';
  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(280), created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);')
  connection.exec("INSERT INTO peeps (peep) VALUES ('test post');")

  connection = PG.connect :dbname => 'chitter_users';
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(80), password VARCHAR(80), name VARCHAR(80), username VARCHAR(80));')
  connection.exec("INSERT INTO users (email, password, name, username) VALUES ('user@test.com', 'user1234', 'User1', 'user1');")

  connection = PG.connect :dbname => 'chitter_users_test';
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(80), password VARCHAR(80), name VARCHAR(80), username VARCHAR(80));')
  connection.exec("INSERT INTO users (email, password, name, username) VALUES ('user@test.com', 'user1234', 'User1', 'user1');")
end
