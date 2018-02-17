if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require './lib/databaseconnection'
require 'pg'

task :test_database_setup do
  p 'Setting up database...'
  DatabaseConnection.setup('chitter_challenge_test')
  DatabaseConnection.query('DROP TABLE IF EXISTS messages')
  DatabaseConnection.query('CREATE TABLE messages (id SERIAL PRIMARY KEY, message VARCHAR(100), title VARCHAR(30))')
  DatabaseConnection.query("INSERT INTO messages(message, title) VALUES('This is a message!', 'Perkele!')")
end

task :set_up do
  p 'Creating databases...'
  %w[chitter_challenge chitter_challenge_test].each do |database|
    con = PG.connect
    con.exec("CREATE DATABASE #{database}")
    DatabaseConnection.setup(database.to_s)
    DatabaseConnection.query('CREATE TABLE messages (id SERIAL PRIMARY KEY, message VARCHAR(100), title VARCHAR(30))')
  end
end
