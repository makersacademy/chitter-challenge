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
  connection.exec("TRUNCATE users;")
  connection.exec("ALTER SEQUENCE peeps_id_seq RESTART WITH 1")
  connection.exec("INSERT INTO peeps (message, time, author) VALUES('Message number 1', '#{Time.now.to_s.split.first(2).join(" ")}', '#{nil}');")
  connection.exec("INSERT INTO peeps (message, time, author) VALUES('I am a message', '#{Time.now.to_s.split.first(2).join(" ")}', '#{nil}');")
  connection.exec("INSERT INTO peeps (message, time, author) VALUES('So am I', '#{Time.now.to_s.split.first(2).join(" ")}', '#{nil}');")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
  connection = PG.connect
  connection.exec("CREATE DATABASE #{ database };")
  connection = PG.connect(dbname: database)
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(120), time VARCHAR(60), author VARCHAR(60));")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), user_name VARCHAR(20), name VARCHAR(60), password VARCHAR(140));")
  end
end

task :teardown do
  p "Tearing down databases..."\
  " type 'y' to confirm that you want to destroy the Bookmark Manager databases."\
  " This will remove all data in those databases!"

  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['chitter', 'chitter_test'].each do |database|
  connection = PG.connect
  connection.exec("DROP DATABASE #{ database };")
  end
end
