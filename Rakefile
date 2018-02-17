require './lib/database_connection.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  p 'Setting up databases...'
  conn = PG.connect
  ['chitter','chitter_test'].each do |database|
      conn.exec("CREATE DATABASE #{database}")
      DatabaseConnection.setup("#{database}")
      DatabaseConnection.query(
        "CREATE TABLE cheeps (id SERIAL PRIMARY KEY, string VARCHAR(140));"
      )
    end
  p 'Set up complete. "chitter" and "chitter_test" databases created'
end

task :test_setup do
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE cheeps;
  INSERT INTO cheeps (string) VALUES ('Today was a good day');
  INSERT INTO cheeps (string) VALUES ('How Can Mirrors Be Real If Our Eyes Arent Real');")
end
