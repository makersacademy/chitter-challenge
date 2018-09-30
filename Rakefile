require 'pg'
require 'bcrypt'

# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#   RSpec::Core::RakeTask.new :spec
#   task default: [:spec]
# end

  task :setup do
    [chitter, chitter_test].each do |database|
      connection = PG.connect
      connection.exec("CREATE DATABASE #{ database };")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE IF NOT EXISTS users(id SERIAL PRIMARY KEY, name VARCHAR, password VARCHAR, email VARCHAR, username VARCHAR);")
      connection.exec("CREATE TABLE IF NOT EXISTS messages(id SERIAL PRIMARY KEY, text VARCHAR, created_at TIMESTAMP, user_id INTEGER REFERENCES users (id));")
    end
  end

  task :test_database_setup do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE users, messages;")
  end
