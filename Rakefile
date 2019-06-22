if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end


task :setup do
  require_relative './database_connection_setup.rb'
  DatabaseConnection.setup(dbname: 'chitter_test')
  DatabaseConnection.query('CREATE TABLE messages(id SERIAL PRIMARY KEY, message VARCHAR(500));')
end

task :teardown do
  require './lib/database_connection.rb'

  def setup_test_database
    p "Setting up test database..."
    DatabaseConnection.setup(dbname: 'chitter_test')
    DatabaseConnection.query("TRUNCATE messages;")
  end
end