require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")

  connection.exec("INSERT INTO peeps VALUES(1, 'Hello Chitter!', '2018-03-18 10:05:20');")
  connection.exec("INSERT INTO peeps VALUES(2, 'My first peep', '2018-03-17 20:24:00');")
  connection.exec("INSERT INTO peeps VALUES(3, 'It is snowing again', '2018-03-17 12:19:05');")
  connection.exec("SELECT setval('peeps_id_seq'::regclass, 10)")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(240), time TIMESTAMP);")
  end
end
