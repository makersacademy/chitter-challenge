require 'pg'

desc "Set up empty databases for testing and development"
task :setup do
  connection = PG.connect

  ['chitter', 'chitter_test'].each do |database|
    connection.exec("CREATE DATABASE #{database};")

    connection = PG.connect :dbname => "#{database}"

    connection.exec("CREATE TABLE users (
                     id SERIAL PRIMARY KEY,
                     email TEXT,
                     password text,
                     username TEXT,
                     name TEXT
                     );")

     connection.exec("CREATE TABLE peeps (
                      id SERIAL PRIMARY KEY,
                      text VARCHAR(140),
                      time TIMESTAMP,
                      user_id INT REFERENCES users (id)
                      );")
  end
end

desc "Delete databases"
task :teardown do
  connection = PG.connect

  ['chitter', 'chitter_test'].each do |database|
    connection.exec("DROP DATABASE #{database};")
  end
end

take :setup_tables do
  connection = PG.connect :dbname => "chitter_test"

  connection.exec("CREATE TABLE users (
                   id SERIAL PRIMARY KEY,
                   email TEXT,
                   password text,
                   username TEXT,
                   name TEXT
                   );")

   connection.exec("CREATE TABLE peeps (
                    id SERIAL PRIMARY KEY,
                    text VARCHAR(140),
                    time TIMESTAMP,
                    user_id INT REFERENCES users (id)
                    );")
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec, :setup]
end
