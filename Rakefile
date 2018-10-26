require './lib/database_connection'
require 'pg'

task :test_database_setup do
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE peeps, users;')
end

task :setup do
  connection = PG.connect
  connection.exec("CREATE DATABASE chitter;")
  connection.exec("CREATE DATABASE chitter_test;")

  ['chitter', 'chitter_test'].each do |database|
    DatabaseConnection.setup(database)
    DatabaseConnection.query('CREATE TABLE users (
      username VARCHAR(20) PRIMARY KEY,
      password VARCHAR(140),
      name VARCHAR(30),
      email VARCHAR(50)
    );')
    DatabaseConnection.query('CREATE TABLE peeps (
      id SERIAL PRIMARY KEY,
      time TIMESTAMP,
      username VARCHAR(20) REFERENCES users(username),
      content VARCHAR(200)
    );')
  end
end

task :create_connection do
  DATABASES = {
    'test' => 'chitter_test',
    'development' => 'chitter'
  }
  database = DATABASES[ENV['ENVIRONMENT']]
  DatabaseConnection.setup(database)
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :spec
  task default: [:spec]
end
