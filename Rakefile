require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the database
  connection.exec("TRUNCATE peeps;")
end

task :create_db do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
  end
end