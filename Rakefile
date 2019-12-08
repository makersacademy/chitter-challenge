if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  namespace :database do
    task :migrate do
      p "Database setup in progress"

      connection = PG.connect
      connection.exec("CREATE DATABASE chitter_test;")
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(280));")
      connection.exec("ALTER TABLE peeps ADD COLUMN time TIMESTAMP;")
      connection.exec("CREATE TABLE makers (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(240), name VARCHAR(20), username VARCHAR(20));")
      connection.exec("ALTER TABLE peeps ADD COLUMN maker_id INTEGER REFERENCES makers (id);")
    end
  end
end
