if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
task :setup do
  p "Creating databases"

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")

    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(300), name VARCHAR(30), username VARCHAR(30));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(240), user_id INTEGER REFERENCES users(id), time VARCHAR(20));")

  end
end

task :travis_setup do
  p "Creating test database"
    connection = PG.connect
    connection.exec("CREATE DATABASE chitter_test")
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(300), name VARCHAR(30), username VARCHAR(30));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(240), user_id INTEGER REFERENCES users(id), time VARCHAR(20));")
  end
end

task :teardown do
  p "You are going to loose it all, type yes if you want to clear databases"

  confirm = STDIN.gets.chomp

  return unless confirm == 'yes'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database }")
  end
end
