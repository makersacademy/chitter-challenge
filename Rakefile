require 'pg'

task :test_database_setup do
  p "setting up the databse ready for testing..."
  connection = PG.connect(dbname: "chitter_test")
  connection.exec("TRUNCATE peeps, users;")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(140));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(240), tstz TIMESTAMPTZ, user_id INTEGER REFERENCES users (id));")
  end
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
