require 'pg'
if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task :test_database_setup do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("DROP TABLE peeps;")
    connection.exec("DROP TABLE users;")

    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(15), message VARCHAR(140), time VARCHAR(100))")
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), name VARCHAR(15), username VARCHAR(15), password VARCHAR(20))")

    connection.exec("ALTER SEQUENCE peeps_id_seq RESTART WITH 1;")
    connection.exec("ALTER SEQUENCE users_id_seq RESTART WITH 1;")

    connection.exec("INSERT INTO peeps (username, message, time) VALUES('Raefe01', 'This is my first post on chitter!', '#{(Time.now + 1*60*60).strftime('%r')}');")
  end
end

task :setup do

  connection = PG.connect
  connection.exec("CREATE DATABASE chitter;")
  connection.exec("CREATE DATABASE chitter_test;")

  connection = PG.connect(dbname: 'chitter')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(15), message VARCHAR(140), time VARCHAR(100))")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), name VARCHAR(15), username VARCHAR(15), password VARCHAR(20))")

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(15), message VARCHAR(140), time VARCHAR(100))")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), name VARCHAR(15), username VARCHAR(15), password VARCHAR(20))")
end

#time = (Time.now + 1*60*60).strftime('%r')
