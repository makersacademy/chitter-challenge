require './env'
require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do

  puts 'Setting up test database'
  connection = PG.connect dbname: DB_TEST
  connection.exec("TRUNCATE TABLE peeps RESTART IDENTITY;")
  connection.exec("INSERT INTO peeps (peep, username, time) VALUES('Test peep 1', 'George', '12pm');")
  connection.exec("INSERT INTO peeps (peep, username, time) VALUES('Test peep 2', 'Charles', '1am');")
  connection.exec("INSERT INTO peeps (peep, username, time) VALUES('Test peep 3', 'James', '1am');")
end

task :setup do
  [DB_NAME, DB_TEST].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect dbname: database
    connection.exec("CREATE TABLE peeps ( id SERIAL PRIMARY KEY, peep VARCHAR(140), username VARCHAR(60), time VARCHAR(60) );" )
  end
end
