require 'rspec/core/rake_task'
require 'pg'

if ENV['RACK_ENV'] == 'test'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps CASCADE;")
  connection.exec("TRUNCATE users CASCADE;")
end

task :setup do
  p "Creating databases..."

  ['chitter_test', 'chitter'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec(
    "CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(60),
    password VARCHAR(60),
    user_name VARCHAR(60),
    name VARCHAR(60)
    );")
    connection.exec(
    "CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    text VARCHAR(300),
    user_id INTEGER REFERENCES users (id),
    time TIMESTAMP DEFAULT NOW()
    );")
  end
end

task :teardown do
  p "Destroying databases...type 'y'
  to confirm that you want to destroy Chitter databases.
  All data will be removed!"

  confirm = STDIN.gets.chomp

  return unless confirm == 'y'

  ['chitter_test', 'chitter'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database}")
  end
end
