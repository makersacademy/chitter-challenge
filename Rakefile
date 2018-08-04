if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :spec
  task default: [:spec]
end

require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_challenge_test')

  # Clear the database
  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")
end

task :setup do
  p "Creating databases..."

  connection = PG.connect
  connection.exec("CREATE DATABASE chitter_challenge;")
  connection.exec("CREATE DATABASE chitter_challenge_test;")

  connection = PG.connect(dbname: 'chitter_challenge')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
                                      peep VARCHAR(140), 
                                      username VARCHAR(60),
                                      created_at TIMESTAMP DEFAULT current_timestamp(0)
                                      );")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, 
                                      email VARCHAR(60), 
                                      password VARCHAR(140),
                                      name VARCHAR(60), 
                                      username VARCHAR(60)
                                      );")

  connection = PG.connect(dbname: 'chitter_challenge_test')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
                                      peep VARCHAR(140), 
                                      username VARCHAR(60),
                                      created_at TIMESTAMP DEFAULT current_timestamp(0)
                                      );")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, 
                                      email VARCHAR(60), 
                                      password VARCHAR(140),
                                      name VARCHAR(60), 
                                      username VARCHAR(60)
                                      );")
end
