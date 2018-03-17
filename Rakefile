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
  connection.exec("ALTER SEQUENCE peeps_id_seq RESTART WITH 1")
  connection.exec("INSERT INTO peeps (message, time) VALUES('Message number 1', '#{Time.now.to_s.split.first(2).join(" ")}');")
  connection.exec("INSERT INTO peeps (message, time) VALUES('I am a message', '#{Time.now.to_s.split.first(2).join(" ")}');")
  connection.exec("INSERT INTO peeps (message, time) VALUES('So am I', '#{Time.now.to_s.split.first(2).join(" ")}');")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
  connection = PG.connect
  connection.exec("CREATE DATABASE #{ database };")
  connection = PG.connect(dbname: database)
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(120), time VARCHAR(60));")
  end
end

task :teardown do
  p "Tearing down databases..."

  ['chitter', 'chitter_test'].each do |database|
  connection = PG.connect
  connection.exec("DROP DATABASE #{ database };")
  end
end
