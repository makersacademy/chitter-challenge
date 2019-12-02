if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  namespace :database do
    task :migrate do
      p "Database setup in progress"

      connection = PG.connect

      connection.exec("CREATE DATABASE chitter;")
      connection = PG.connect(dbname: 'chitter')
      connection.exec("CREATE TABLE 'peeps' ('id' SERIAL PRIMARY KEY, 'body' varchar(280));")

      connection.exec("CREATE DATABASE chitter_test;")
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("CREATE TABLE 'peeps' ('id' SERIAL PRIMARY KEY, 'body' varchar(280));")

    end
  end
end
