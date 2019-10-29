if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

PG::Core::RakeTask.new :setup
task :setup do
  ['chitter', 'chitter_test']. each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(20), email VARCHAR(60), password VARCHAR(30));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(240), date VARCHAR(10), time VARCHAR(5), user_id INTEGER REFERENCES users (id) ON DELETE CASCADE);")
    connection.exec("CREATE TABLE replies(id SERIAL PRIMARY KEY, content VARCHAR(240), date VARCHAR(10), time VARCHAR(5), user_id INTEGER REFERENCES users (id), peep_id INTEGER REFERENCES peeps (id) ON DELETE CASCADE);")
  end
end
