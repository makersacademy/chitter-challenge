if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :setup do
    p "Creating databases"

    connection = PG.connect
    connection.exec("CREATE DATABASE chitter;")
    connection.exec("CREATE DATABASE chitter_test;")

    connection = PG.connect(dbname: 'chitter')
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140));")

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140));")
  end
end
