require 'pg'
require_relative './lib/database_connection.rb'
if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

 task :test_database_setup do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE users, peeps;")
end
 task :setup do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(200));")
    connection.exec("ALTER TABLE peeps ADD COLUMN posted_datetime TIMESTAMP;")
    connection.exec("ALTER TABLE peeps ALTER COLUMN posted_datetime SET DEFAULT localtimestamp;")
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, firstname VARCHAR(60), lastname VARCHAR(60), username VARCHAR(60), password VARCHAR(60), email VARCHAR(100));")
    connection.exec("ALTER TABLE peeps ADD COLUMN user_id INTEGER REFERENCES users (id);")
    connection.exec("ALTER TABLE peeps ADD COLUMN parent_peep int;")
  end
end
