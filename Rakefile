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
    peeps = "CREATE TABLE peeps
    (id SERIAL PRIMARY KEY, post VARCHAR(140), time TIMESTAMP);"
    DatabaseConnection.query(peeps)
    users = "CREATE TABLE users
    (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));"
    DatabaseConnection.query(users)
  end
end

task :setup_test_database do
  p 'Loading test database...'
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE peeps;")
  DatabaseConnection.query("TRUNCATE users;")
  DatabaseConnection.query("INSERT INTO peeps (post, time)
  VALUES('This is a test peep', 'NOW()');")
end

task :teardown do
  p "Destroying databases... type 'y' to confirm"
  confirmation = STDIN.gets.chomp
  return unless confirmation == 'y'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database}")
  end
end
