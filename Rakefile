require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
  task :test_database_setup do
    p "Clean my database..."

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE users, peeps;")
  end
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")

    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60) UNIQUE, name VARCHAR(60), handle VARCHAR(60) UNIQUE, password VARCHAR(240));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, user_id INTEGER REFERENCE users(id), peep VARCHAR(240));")
  end
end

task :teardown do
  p 'Destroying the monster...'
  
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database};")
  end
end

