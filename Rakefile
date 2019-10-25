if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
require 'pg'
task :setup do

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, time_stamp VARCHAR(10), messages VARCHAR(60));")
    connection.exec("CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60));")
    connection.exec("CREATE TABLE peeps_tags(tag_id INTEGER REFERENCES tags (id), peep_id INTEGER REFERENCES peeps (id));")
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));")
  end
end
