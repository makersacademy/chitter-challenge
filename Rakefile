require 'pg'
require_relative 'lib/database_connection'

if ENV['ENVIRONMENT'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  p 'Setting up databases and tables'
  connection = PG.connect
  ['chitter', 'chitter_test'].each do |database|
    connection.exec("CREATE DATABASE #{database};")
    DatabaseConnection.setup("#{database}")
    sql = "CREATE TABLE peeps (id SERIAL PRIMARY KEY, post VARCHAR(140));"
    DatabaseConnection.query(sql)
  end
end

task :setup_test_database do
  p 'Loading test values into test database...'
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE peeps;
  INSERT INTO peeps (post) VALUES('This is a test peep');
  INSERT INTO peeps (post) VALUES('Look at me; I''m peeping!');
  INSERT INTO peeps (post) VALUES('Who wants to follow me?');")
end
