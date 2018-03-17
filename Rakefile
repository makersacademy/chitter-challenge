if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

task :setup do
  p "Creating databases..."

  ['blahblah', 'blahblah_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")

    connection = PG.connect(dbname: database)

    connection.exec("CREATE TABLE messages(id SERIAL PRIMARY KEY, message VARCHAR(140), date TIMESTAMP);")
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));")

    p "Created database: #{database}"
  end
end

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'blahblah_test')

  connection.exec("TRUNCATE messages")
  connection.exec("TRUNCATE users")

  connection.exec("INSERT INTO messages VALUES(1, 'One simple message', '2015-10-19 10:23:54')")
  connection.exec("INSERT INTO messages VALUES(2, 'Another simple message', '2016-10-19 10:23:54')")
  connection.exec("INSERT INTO messages VALUES(3, 'My last simple message', '2017-10-19 10:23:54')")

  p "Databases populated"
end

task :teardown do
  p "Destroying blahblah databases"
  p "type 'y' to continue"

  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['blahblah', 'blahblah_test'].each do |database|
    connection = PG.connect

    connection.exec("DROP DATABASE #{database}")

    p "Completed destroying database: #{database}"
  end
end
