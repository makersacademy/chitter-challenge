if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

task :clear_test_database do
  p 'Clearing test database...'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users");
end

task :setup_databases do
  p 'Setting up databases...'
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR, time TIMESTAMP);")
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(30), email VARCHAR(60), password VARCHAR(140));")
  end
end
