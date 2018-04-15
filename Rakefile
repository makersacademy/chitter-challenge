require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task :test_database_setup do

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE peeps;")

  end

  task :setup do
    p "Creating databases..."
    connection = PG.connect
    connection.exec('CREATE DATABASE chitter;')
    connection.exec('CREATE DATABASE chitter_test;')

    connection = PG.connect(dbname: 'chitter')
    connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(15), message VARCHAR(150), time VARCHAR(60));')
    connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(15), password VARCHAR(15), email VARCHAR(60));')

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(15), message VARCHAR(150), time VARCHAR(60));')
    connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(15), password VARCHAR(15), email VARCHAR(60));')


  end

end
