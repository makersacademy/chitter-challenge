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
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, "\
      "name VARCHAR(100), username VARCHAR(100), email VARCHAR(60), "\
      "password VARCHAR(140));")
    connection.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY, text "\
      "VARCHAR(140), user_id INTEGER REFERENCES users (id));")
    connection.exec("ALTER TABLE peeps ADD COLUMN time VARCHAR(60);")
    connection.exec("ALTER TABLE peeps ADD COLUMN date timestamp;
      UPDATE peeps SET date = to_timestamp(time, 'yy-mm-dd hh24:mi');
      ALTER TABLE peeps DROP time;")
  end
end
