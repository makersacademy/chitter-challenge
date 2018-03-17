require 'rake'
require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task :default do
    %w[chitter chitter_test].each do |database|
      begin
        connection = PG.connect
        connection.exec("CREATE DATABASE #{database};")
      rescue StandardError
        p "#{database} Database already exists"
      end

      connection = PG.connect(dbname: database)

      begin

        connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140),realname VARCHAR(20), username VARCHAR(15);")

        connection.exec('CREATE TABLE peeps(
        id SERIAL PRIMARY KEY,
        author VARCHAR(15),
        text VARCHAR(140),
        time TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
        reply_id INTEGER NULL,
        FOREIGN KEY (reply_id) REFERENCES peeps(id)
        FOREIGN KEY (author) REFERENCES users(username)
        );')

      rescue StandardError
        p "table already exists in #{database}"
      end
    end
  end
end

task :teardown do
  p 'Tearing down databases...'

  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: "#{database}", user: "alfiedarko")

    connection.exec("DROP TABLE peeps CASCADE")
    p "dropped peeps table from #{database}"
    connection.exec("DROP DATABASE #{database};")
    p "dropped #{database} database!"
  end
end

task :test_environment do
  connection = PG.connect(dbname: "chitter_test", user: "alfiedarko")
  connection.exec("INSERT INTO peeps (author, text) VALUES ('@Alfie', 'My first tweet!')")
end
