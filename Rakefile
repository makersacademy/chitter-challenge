if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

require 'pg'

task :setup do
  p "Creating databases..."

  ['peeps', 'peeps_test'].each do |database|
    connection = PG.connect
    connection.exec("SELECT pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE pg_stat_activity.datname = '#{database}'
      AND pid <> pg_backend_pid();")
    
    connection.exec("DROP DATABASE IF EXISTS #{database};")
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)

    connection.exec("CREATE TABLE users(
      id SERIAL PRIMARY KEY, email VARCHAR(100) NOT NULL UNIQUE, password VARCHAR(100), 
      name VARCHAR(100), username VARCHAR(100) NOT NULL UNIQUE);")

    connection.exec("CREATE TABLE messages(
      id SERIAL PRIMARY KEY, text VARCHAR(280), created TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP, 
      user_id INTEGER REFERENCES users(id));")

  end
end
