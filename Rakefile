require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  p "-+-+- Creating databases -+-+-"
  ["chitter", "chitter_test"].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")
    connection = PG.connect(dbname: "#{database}")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY,
      text VARCHAR(240));")
  end
end

task :populate_test_database do
  p ' -+-+- Populating test database -+-+-'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
  connection.exec("INSERT INTO peeps VALUES(1, 'Hello world');")
  connection.exec("INSERT INTO peeps VALUES(2, 'Goodbye!');")
end

task :remove_databases do
  p "-+-+- Removing databases -+-+-"

  ["chitter", "chitter_test"].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database};")
  end
end
