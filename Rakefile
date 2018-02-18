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

  connection.exec("INSERT INTO peeps VALUES(1, 'This is a test peep');")
  connection.exec("INSERT INTO peeps VALUES(2, 'This is another test peep');")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, post VARCHAR(240));")
  end
end
