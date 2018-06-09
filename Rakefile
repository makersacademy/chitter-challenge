require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

  task :test_database_setup do

    # p "Cleaning database"

    connection = PG.connect(dbname: 'chitter_test')

    # Clear the database
    connection.exec("TRUNCATE peeps;")
  end

  task :setup do
    # p "Creating databases..."

    ['chitter', 'chitter_test'].each do |database|
      connection = PG.connect
      connection.exec("CREATE DATABASE #{ database };")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(140), created_at TIMESTAMP DEFAULT current_timestamp(0));")
    end
  end
