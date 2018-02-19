require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do

  p 'Setting up test database...'

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")

  connection.exec("INSERT INTO peeps VALUES('test peep 1', '#{Time.now}', 'superman', 'Clark Kent');")
  connection.exec("INSERT INTO peeps VALUES('test peep 2', '#{Time.now}', 'batman', 'Bruce Wayne');")
  connection.exec("INSERT INTO peeps VALUES('test peep 3', '#{Time.now}', 'spiderman', 'Peter Parker');")
  connection.exec("INSERT INTO users VALUES(1, 'test@example.com', 'TestName', 'TestUsername');")
end

task :setup do
  connection = PG.connect("CREATE DATABASE chitter;")
  connection = PG.connect("CREATE DATABASE chitter_test;")

  connection = PG.connect(dbname: 'chitter')
  connection.exec("CREATE TABLE peeps(message VARCHAR(140), time TIMESTAMP, username VARCHAR(20), name VARCHAR(30));")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(100), password VARCHAR(30), name VARCHAR(30), username VARCHAR(20));")

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("CREATE TABLE peeps(message VARCHAR(140), time TIMESTAMP, username VARCHAR(20), name VARCHAR(30));")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(100), password VARCHAR(30), name VARCHAR(30), username VARCHAR(20));")
end
