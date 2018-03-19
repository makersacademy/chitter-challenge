require 'pg'
require './lib/database_connection.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task default: ['setup', 'test_database_setup']

task :setup do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    begin
      connection.exec("CREATE DATABASE #{database};")
      connection = PG.connect(dbname: database)
      p "Database #{database} created."
    rescue PG::Error => error
      puts error.message
    end

    begin
      connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, user_handle VARCHAR(12), peep VARCHAR(140));")
      p "Tables on #{database} created."
    rescue PG::Error => e
      puts e.message
    end

  end
end

task :test_database_setup do
  DatabaseConnection.setup('chitter_test')

  DatabaseConnection.query("TRUNCATE peeps;")

  DatabaseConnection.query("INSERT INTO peeps (user_handle, peep) VALUES('SherlockH', 'What a beautiful morning!');")
  DatabaseConnection.query("INSERT INTO peeps (user_handle, peep) VALUES('SherlockH', 'Back on terra firma.');")
  DatabaseConnection.query("INSERT INTO peeps (user_handle, peep) VALUES('SherlockH', 'Free as a bird.');")
end
