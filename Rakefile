require 'pg'
#
# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#
#   RSpec::Core::RakeTask.new :spec
#
#   task default: [:spec]
# end

namespace :chitter do
  desc 'creates both production and test databases'
  # creates tables for production and test environments
  task :setup do
    p 'Setting-up production and test databases...'
    databases = ['chitter', 'chitter_test']
    databases.each do |database|
      connection = PG.connect
      p "CONNECTED"
      connection.exec "CREATE DATABASE #{database}"
      p "CREATE DATABASE"
      connection = PG.connect(dbname: database)
      p "CONNECT TO DATABASE"
      connection.exec "CREATE TABLE peeps(
        id SERIAL PRIMARY KEY,
        time VARCHAR(60),
        name VARCHAR(60),
        username VARCHAR(60),
        peep VARCHAR(250)
      )"
      p "CREATE PEEPS TABLE IN DATABASE"
      p "END"
    end
  end

  desc 'clears and inserts test data into peeps table for test environment'
  task :test_setup do
    p 'Setting test data...'
    connection = PG.connect(dbname: 'chitter_test')
    # clear test data before everyrun
    connection.exec("TRUNCATE peeps;")
    #input test data
    connection.exec("INSERT INTO peeps VALUES(1, '2018-03-17 13:40:22', 'Daniel Campos', '@ddregalo', 'My first peep!');")
    connection.exec("INSERT INTO peeps VALUES(2, '2018-03-17 13:45:44', 'Bhav P', '@bhavy', 'The world is flat.');")
   end
end

namespace :account do
  desc 'Creates account production and test environment with accounts tables'
  task :setup do
    p 'Setting up account tables (production/test)...'
    databases = ['chitter', 'chitter_test']
    databases.each do |database|
      connection = PG.connect
      p "CONNECTED"
      connection = PG.connect(dbname: database)
      p "CONNECT TO DATABASE"
      connection.exec "CREATE TABLE accounts(
        id SERIAL PRIMARY KEY,
        name VARCHAR(60),
        username VARCHAR(30),
        email VARCHAR(50),
        password VARCHAR(30)
      )"
      p "CREATE ACCOUNTS TABLE IN DATABASE"
      p "END"
    end
  end

  desc 'clears and inserts test data into accounts table for test environment'
  task :test_setup do
    p 'Setting test data...'
    connection = PG.connect(dbname: 'chitter_test')
    # clear test data before everyrun
    connection.exec("TRUNCATE accounts;")
    #input test data
    connection.exec("INSERT INTO accounts(name, username, email, password) VALUES('Daniel Campos', '@ddregalo', 'info@ddregalo.com', 'password123');")
    connection.exec("INSERT INTO accounts(name, username, email, password) VALUES('Bhav P', '@bhavy', 'bhav@bhavy.com', 'password321');")
   end
end
