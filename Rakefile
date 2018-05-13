if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(60), time VARCHAR(60));")
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));")
  end
end

task :test_database_setup do
  # p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users;")
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
