require 'pg'
if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end


task :test_database_setup do
  p 'Setting up test database...'
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")
  connection.exec("INSERT INTO peeps VALUES(1, 'Nice day for coding', '2018-02-17 15:54:04', 'Justyna');")
  connection.exec("INSERT INTO peeps VALUES(1, 'Bad day for coding', '2018-02-17 15:55:04', 'Igor');")
end

task :setup do
  p "Creating databases..."
  ["chitter", "chitter_test"].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")
    connection = PG.connect(dbname: "#{database}")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(240), date TIMESTAMP, author VARCHAR(50));")
  end
end

task :teardown do
  p "Tearing down databases..."

  ["chitter", "chitter_test"].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database };")
  end
end
