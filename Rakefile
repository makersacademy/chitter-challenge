if ENV['RACK_ENV'] != 'production'
  require 'pg'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  task :setup_test_db do
    p "setting up test database..."

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE peeps, users;")
  end

  task :setup do
    p "Creating databases..."

    ['chitter', 'chitter_test'].each do |database|
      connection = PG.connect
      connection.exec("DROP DATABASE IF EXISTS #{database};")
      connection.exec("CREATE DATABASE #{database};")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE IF NOT EXISTS peeps (
        id SERIAL PRIMARY KEY, time TIMESTAMP, message VARCHAR(200));")
      connection.exec("CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY,
        name VARCHAR(60), email VARCHAR(60), password VARCHAR(140));")
    end
  end
end
