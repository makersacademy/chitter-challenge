require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :spec
end

  task :test_database_setup do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE users, messages;")
  end

  task :setup do
    [chitter, chitter_test].each do |database|
      connection = PG.connect
      connection.exec("CREATE DATABASE #{ database };")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR, password VARCHAR, email VARCHAR, username VARCHAR);")
      connection.exec("CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR, created_at TIMESTAMP, user_id INTEGER REFERENCES users (id));")
    end
  end

    task :clear_database do
      ['chitter', 'chitter_test'].each do |database|
        connection = PG.connect
        connection.exec("DROP DATABASE #{database};")
      end
    end
