if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :setup do
    p "Creating databases..."

    ['chitter', 'chitter_test'].each do |database|
      connection = PG.connect
      connection.exec("CREATE DATABASE #{ database };")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(60), time VARCHAR(60));")
      connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));")
    end
  end
end
