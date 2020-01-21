require 'pg'

task :setup do
  connection = PG.connect
  connection.exec('DROP DATABASE IF EXISTS chitter;')
  connection.exec('CREATE DATABASE chitter;')

  connection.exec('DROP DATABASE IF EXISTS chitter_test;')
  connection.exec('CREATE DATABASE chitter_test;')

  connection = PG.connect :dbname => 'chitter';
  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(280), created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);')
  connection.exec("INSERT INTO peeps (peep) VALUES ('test post');")
  connection = PG.connect :dbname => 'chitter_test';
  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(280), created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);')
  connection.exec("INSERT INTO peeps (peep) VALUES ('test post');")
end
