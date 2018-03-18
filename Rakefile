require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:setup, :test_database_setup, :spec]
end

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")

  # Add the test data
  #connection.exec("SELECT setval('peeps_id_seq'::regclass, 1)")
  connection.exec('ALTER SEQUENCE peeps_id_seq RESTART WITH 1')
  connection.exec("INSERT INTO peeps(message, time) VALUES('Hello Chitter!', '2018-03-18 10:05:20');")
  connection.exec("INSERT INTO peeps(message, time) VALUES('My first peep', '2018-03-17 20:24:00');")
  connection.exec("INSERT INTO peeps(message, time) VALUES('It is snowing again', '2018-03-17 12:19:05');")

end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(240), time TIMESTAMP);")
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140), name VARCHAR(60), username VARCHAR(60))")
  end
end

task :teardown do
  p "Destroying databases...type 'y' to confirm that you want to destroy the Chitter databases. This will remove all data in those databases!"

  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database }")
  end
end
