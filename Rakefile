if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  require 'pg'

  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  namespace :database do
    task :migrate do
      p "Database setup in progress"

      connection = PG.connect

      connection.exec("CREATE DATABASE message_database_test;")
      connection = PG.connect(dbname: 'message_database_test')
      connection.exec("CREATE TABLE messages(id SERIAL PRIMARY KEY, username VARCHAR, message VARCHAR(100), time VARCHAR);")
      connection.exec("CREATE TABLE accounts(id SERIAL PRIMARY KEY, username VARCHAR, email VARCHAR, password VARCHAR);")

    end
  end
end
