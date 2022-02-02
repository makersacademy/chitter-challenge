require 'pg'

task :test_database_setup do
  p "Setting up test database..."
  
  connection = PG.connect(dbname: 'chitter_test')
  
  # Clear the peeps table and the users table
  connection.exec("TRUNCATE peeps, users;")
end

task :initial_databases_setup do
  p 'creating test and development databases...'
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec('CREATE DATABASE #{ database };')
    connection.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(280), user_id VARCHAR(5));')
    connection.exec('ALTER TABLE peeps ADD COLUMN time VARCHAR(20);')
    connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(50) UNIQUE, handle VARCHAR(8) UNIQUE, password VARCHAR(140));')
  end
end