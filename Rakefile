require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_app')
  # Clear the database
  # connection.exec("TRUNCATE chitter, users;")
end

task :setup do
  p "Creating databases..."

  ['chitter_app', 'chitter_app_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE chitter (id SERIAL PRIMARY KEY, name VARCHAR(60), post VARCHAR(280));")
    connection.exec("ALTER TABLE chitter ADD time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;")
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name varchar(15), email varchar(60), password VARCHAR(140));")
  end
end