require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup_test_database do

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE cheeps;")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE cheeps (handle VARCHAR(60), name VARCHAR(60), message VARCHAR(60), time VARCHAR(60), id SERIAL PRIMARY KEY);")
  end
end
