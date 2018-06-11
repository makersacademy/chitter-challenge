require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  p "Creating databases..."

  ['chitter_test', 'chitter'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(user_id SERIAL PRIMARY KEY, \
      name VARCHAR(30) UNIQUE, username VARCHAR(20) UNIQUE, email VARCHAR(25) \
      UNIQUE, password VARCHAR(60));")
    connection.exec("CREATE TABLE peeps(peep_id SERIAL PRIMARY KEY, \
      message VARCHAR(110), name VARCHAR(30) REFERENCES users(name), \
      username VARCHAR(20) REFERENCES users(username), time TIME);")
  end
end

task :test_database_setup do
  p "Cleaning the database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE users, peeps CASCADE;")
  connection.close
end

task :teardown do
  p "Destroying databases... type 'y' to destroy the Chitter databases."

  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database}")
  end
end
